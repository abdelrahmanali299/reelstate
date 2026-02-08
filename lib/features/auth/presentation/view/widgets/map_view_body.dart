// import 'package:flutter/material.dart';

// import 'package:reelstate/core/utils/widgets/custom_button.dart';
// import 'package:reelstate/features/auth/presentation/view/widgets/map_screen.dart';

// class MapViewBody extends StatelessWidget {
//   const MapViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         SizedBox(height: 50),
//         Text(
//           'Choose Location',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(
//               right: 32,
//               left: 32,
//               top: 20,
//               bottom: 20,
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: const MapScreen(),
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.gps_fixed)),
//             Expanded(
//               child: CustomButton(
               
//                 title: 'confirm location',
//                 titleColor: Colors.white,
//                 // isUnderlined: false,
//                 onTap: () {},
//                 color: Color(0xff11D4C4),
//                 height: 70,
//                 width: 10,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 40),
//       ],
//     );
//   }
// }
