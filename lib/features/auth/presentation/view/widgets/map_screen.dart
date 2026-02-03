// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart' as loc;

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final loc.Location location = loc.Location();
//   LatLng? selected;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) return;
//     }

//     loc.PermissionStatus permissionGranted = await location.hasPermission();
//     if (permissionGranted == loc.PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != loc.PermissionStatus.granted) return;
//     }

//     final locData = await location.getLocation();
//     if (!mounted) return;

//     setState(() {
//       selected = LatLng(locData.latitude!, locData.longitude!);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return selected == null
//         ? const Center(child: CircularProgressIndicator())
//         : FlutterMap(
//             options: MapOptions(
//               initialCenter: selected!,
//               initialZoom: 15,
//               onTap: (tapPosition, point) {
//                 setState(() {
//                   selected = point;
//                 });
//               },
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: ['a', 'b', 'c'],
//                 maxZoom: 19,

//                 userAgentPackageName: 'cartify', // مهم تحطه هنا
//               ),
//               MarkerLayer(
//                 markers: [
//                   Marker(
//                     point: selected!,
//                     width: 40,
//                     height: 40,
//                     child: const Icon(
//                       Icons.location_on,
//                       color: Colors.red,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//   }
// }
