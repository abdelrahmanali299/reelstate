// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickSection extends StatefulWidget {
//   const ImagePickSection({super.key});

//   @override
//   State<ImagePickSection> createState() => _ImagePickSectionState();
// }

// class _ImagePickSectionState extends State<ImagePickSection> {
//   File? image;
//   final ImagePicker picker = ImagePicker();

//   Future<void> pickFromCamera() async {
//     final XFile? picked = await picker.pickImage(source: ImageSource.camera);
//     if (picked != null) {
//       setState(() {
//         image = File(picked.path);
//       });
//     }
//   }

//   Future<void> pickFromGallery() async {
//     final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         image = File(picked.path);
//       });
//     }
//   }

//   void showPickOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('الكاميرا'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickFromCamera();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo),
//                 title: const Text('المعرض'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickFromGallery();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: showPickOptions,
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: const Color(0xffE2E8F0),
//         backgroundImage: image != null ? FileImage(image!) : null,
//         child: image == null
//             ? const Icon(Icons.person, color: Color(0xff94A3B8), size: 48)
//             : null,
//       ),
//     );
//   }
// }
