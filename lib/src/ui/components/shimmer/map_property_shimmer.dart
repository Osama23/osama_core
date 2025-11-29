// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:osama_core/osama_core.dart';
// import 'package:shimmer/shimmer.dart';

// class MapPropertyShimmer extends StatelessWidget {
//   const MapPropertyShimmer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
//       child: Container(
//         padding: AppDimensions.symmetricH12V12,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppColors.colorFFFFFF,
//         ),
//         child: Shimmer.fromColors(
//           baseColor: AppColors.colorE0E0E0,
//           enabled: true,
//           highlightColor: AppColors.colorFFFFFF,
//           child: const _PropertyShimmer(),
//         ),
//       ),
//     );
//   }
// }

// class _PropertyShimmer extends StatelessWidget {
//   const _PropertyShimmer();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 200.h,
//         padding: const EdgeInsets.all(5),
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: AppColors.colorFFFFFF,
//                 ),
//                 padding: const EdgeInsets.symmetric(vertical: 4.0),
//                 height: 117,
//                 width: MediaQuery.of(context).size.width * 0.3,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 8.0, bottom: 3, left: 8, right: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(
//                           top: 5.0,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: AppColors.colorFFFFFF,
//                         ),
//                         height: 20,
//                         width: MediaQuery.of(context).size.width * 0.26,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(
//                           top: 5.0,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: AppColors.colorFFFFFF,
//                         ),
//                         height: 20,
//                         width: MediaQuery.of(context).size.width * 0.4,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(
//                           top: 5.0,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6),
//                           color: AppColors.colorFFFFFF,
//                         ),
//                         height: 20,
//                         width: MediaQuery.of(context).size.width * 0.2,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(top: 5.0, right: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: AppColors.colorFFFFFF,
//                             ),
//                             height: 15,
//                             width: 15,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(top: 5.0, right: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: AppColors.colorFFFFFF,
//                             ),
//                             height: 15,
//                             width: 15,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(top: 5.0, right: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               color: AppColors.colorFFFFFF,
//                             ),
//                             height: 15,
//                             width: 15,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ]));
//   }
// }
