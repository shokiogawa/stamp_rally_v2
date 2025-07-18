// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:stamp_rally_v2_fvm/core/data/place/place_model.dart';
// import 'package:stamp_rally_v2_fvm/core/provider/fetch_place_provider.dart';
// import 'package:stamp_rally_v2_fvm/feature/google_map/provider/page_controller_provider.dart';
//
// class GoogleMapPage extends HookConsumerWidget {
//   const GoogleMapPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mapController = useState<GoogleMapController?>(null);
//     final placeAsyncNotifier = ref.watch(fetchPlacesProvider);
//
//     final selectedPlacetate = useState<PlaceModel?>(null);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('スタンプラリーマップ')),
//       body: placeAsyncNotifier.when(
//         data: (places) {
//           selectedPlacetate.value = places.isNotEmpty ? places[0] : null;
//           Set<Marker> markers = places.map<Marker>((place) {
//             return Marker(
//               markerId: MarkerId(place.historicSpotId.toString()),
//               position: LatLng(place.latitude, place.longitude),
//               infoWindow: InfoWindow(title: place.name),
//               icon: BitmapDescriptor.defaultMarkerWithHue(
//                   BitmapDescriptor.hueRed),
//               onTap: () {},
//             );
//           }).toSet();
//
//           return Stack(children: [
//             // 【GoogleMapの表示】
//             GoogleMap(
//               onMapCreated: (controller) {
//                 mapController.value = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(places[0].latitude, places[0].longitude),
//                 zoom: 14.0,
//               ),
//               markers: markers,
//             ),
//             // 【カルーセル】
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: SizedBox(
//                   //height: 285,
//                   height: MediaQuery.textScalerOf(context).scale(230),
//                   child: PageView.builder(
//                       controller: ref.watch(pageControllerProvider),
//                       onPageChanged: (int index) async {
//                         mapController.value?.animateCamera(
//                           CameraUpdate.newLatLng(
//                             LatLng(places[index].latitude,
//                                 places[index].longitude),
//                           ),
//                         );
//                       },
//                       scrollDirection: Axis.horizontal,
//                       itemCount: places.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final data = places[index];
//                         // 以下のChargerCardコンポーネントに情報をprovider。
//                         // overrideしない場合、エラーになるので注意。
//                         return SizedBox(
//                           child: _StampDetailCard(
//                             place: data,
//                           ),
//                         );
//                       })),
//             ),
//           ]);
//         },
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
//       ),
//     );
//   }
// }
//
// // スタンプの詳細カード
// class _StampDetailCard extends StatelessWidget {
//   final PlaceModel place;
//
//   const _StampDetailCard({
//     required this.place,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(
//                 'assets/images/oshiyama.jpg',
//                 height: 90,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(height: 8),
//               Text(place.name,
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               const Text(
//                   "おしやま公園は自然豊かな公園で、家族連れや観光客に人気のスポットです。春には桜が咲き誇り、ピクニックにも最適です。",
//                   style: TextStyle(fontSize: 14)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
