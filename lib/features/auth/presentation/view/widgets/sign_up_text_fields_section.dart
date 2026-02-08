import 'dart:developer';

import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/models/address_model.dart';
import 'package:reelstate/core/services/function/custom_snack_bar.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/core/utils/widgets/pick_location.dart';
import 'package:reelstate/features/auth/data/model/user_model.dart';
import 'package:reelstate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class SignUpTextFieldsSection extends StatefulWidget {
  const SignUpTextFieldsSection({super.key});
  @override
  State<SignUpTextFieldsSection> createState() =>
      _SignUpTextFieldsSectionState();
}

class _SignUpTextFieldsSectionState extends State<SignUpTextFieldsSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final streetController = TextEditingController();
  AddressModel addressModel = AddressModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          customSnackBar(context, 'sign up successfully', Colors.green);
        } else if (state is SignUpFailure) {
          customSnackBar(context, state.message, Colors.red);
          log(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('الاسم بالكامل', style: AppTextStyles.semiBold14),
              ),
              CustomTextField(
                controller: nameController,
                hint: 'الاسم بالكامل',
                fillColor: Colors.white,
              ),
              const SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'البريد الالكتروني',
                  style: AppTextStyles.semiBold14,
                ),
              ),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hint: 'البريد الالكتروني',
                fillColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('رقم الهاتف', style: AppTextStyles.semiBold14),
              ),
              CustomTextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                hint: 'رقم الهاتف',
                fillColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('كلمة المرور', style: AppTextStyles.semiBold14),
              ),
              CustomTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                hint: 'كلمة المرور',
                fillColor: Colors.white,
                isPassword: true,
              ),
              SizedBox(height: 50),

              CustomButton(
                onTap: () {
                  submitSignUp(context);
                },
                borderColor: Color(0xff11D4C4),
                title: 'انشاء حساب',
                color: Color(0xff11D4C4),
                titleColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  void submitSignUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (bottomSheetcontext) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(bottomSheetcontext).viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('بيانات العنوان', style: AppTextStyles.bold18),
                  const SizedBox(height: 16),
                  PickLocation(
                    onCountryChanged: (country) {
                      addressModel.country = country;
                    },
                    onStateChanged: (state) {
                      addressModel.state = state;
                    },
                    onCityChanged: (city) {
                      addressModel.city = city;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: streetController,
                    hint: 'الشارع / العنوان التفصيلي',
                    fillColor: Colors.white,
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    title: 'تأكيد وإنشاء الحساب',
                    color: const Color(0xff11D4C4),
                    titleColor: Colors.white,
                    onTap: () {
                      print(addressModel.toJson());
                      if (addressModel.country == null ||
                          addressModel.city == null ||
                          addressModel.state == null ||
                          streetController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height -
                                  100, // يرفعه للأعلى
                              right: 20,
                              left: 20,
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: Text('من فضلك أكمل بيانات العنوان'),
                          ),
                        );

                        return;
                      }
                      addressModel.street = streetController.text;
                      context.read<AuthCubit>().signUp(
                        userModel: UserModel(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          addressModel: addressModel,
                        ),
                      );

                      Navigator.pop(bottomSheetcontext);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
