// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:osama_core/osama_core.dart';
// import 'package:shimmer/shimmer.dart';

// class PropertyFilterPage extends StatelessWidget {
//   const PropertyFilterPage(this.isLand, {super.key});
//   final bool isLand;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: [
//       if (!isLand) ...[
//         Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Container(
//             height: 19.h,
//             width: 135.w,
//             color: AppColors.colorFFFFFF,
//           )
//         ]),
//         SizedBox(
//           height: 23.h,
//         ),
//         Container(
//           height: 58.h,
//           width: double.infinity,
//           color: AppColors.colorFFFFFF,
//         ),
//         SizedBox(
//           height: 30.h,
//         )
//       ],
//       Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Container(
//           height: 19.h,
//           width: 135.w,
//           color: AppColors.colorFFFFFF,
//         )
//       ]),
//       SizedBox(
//         height: 23.h,
//       ),
//       Container(
//         height: 30.h,
//         width: double.infinity,
//         color: AppColors.colorFFFFFF,
//       ),
//       SizedBox(
//         height: 30.h,
//       ),
//       Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Container(
//           height: 19.h,
//           width: 135.w,
//           color: AppColors.colorFFFFFF,
//         )
//       ]),
//       SizedBox(
//         height: 23.h,
//       ),
//       Container(
//         height: 30.h,
//         width: double.infinity,
//         color: AppColors.colorFFFFFF,
//       ),
//       SizedBox(
//         height: 30.h,
//       ),
//       if (isLand) ...[
//         Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Container(
//             height: 19.h,
//             width: 135.w,
//             color: AppColors.colorFFFFFF,
//           )
//         ]),
//         SizedBox(
//           height: 23.h,
//         ),
//         Container(
//           height: 30.h,
//           width: double.infinity,
//           color: AppColors.colorFFFFFF,
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Container(
//             height: 19.h,
//             width: 135.w,
//             color: AppColors.colorFFFFFF,
//           )
//         ]),
//         SizedBox(
//           height: 23.h,
//         ),
//         Container(
//           height: 30.h,
//           width: double.infinity,
//           color: AppColors.colorFFFFFF,
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Container(
//           height: 52.h,
//           width: double.infinity,
//           color: AppColors.colorFFFFFF,
//         ),
//         SizedBox(
//           height: 23.h,
//         ),
//         Container(
//           height: 52.h,
//           width: double.infinity,
//           color: AppColors.colorFFFFFF,
//         )
//       ],
//       if (!isLand) ...[
//         Container(
//           width: 135.w,
//           color: AppColors.colorFFFFFF,
//           height: 19.h,
//         ),
//         const SizedBox(
//           height: 18,
//         ),
//         Row(
//           children: [
//             Expanded(
//                 flex: 1,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 18.h,
//                       width: 18.w,
//                       color: AppColors.colorFFFFFF,
//                     ),
//                     SizedBox(
//                       width: 11.w,
//                     ),
//                     Container(
//                       height: 18.h,
//                       width: 50.w,
//                       color: AppColors.colorFFFFFF,
//                     ),
//                   ],
//                 )),
//             Expanded(
//                 flex: 1,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 18.h,
//                       width: 18.w,
//                       color: AppColors.colorFFFFFF,
//                     ),
//                     SizedBox(
//                       width: 11.w,
//                     ),
//                     Container(
//                       height: 18.h,
//                       width: 50.w,
//                       color: AppColors.colorFFFFFF,
//                     ),
//                   ],
//                 )),
//           ],
//         )
//       ],
//       SizedBox(
//         height: 64.h,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//               child: Container(
//             height: 41.h,
//             width: 10.w,
//             color: AppColors.colorFFFFFF,
//           )),
//           SizedBox(
//             width: 12.w,
//           ),
//           Expanded(
//               child: Container(
//             height: 41.h,
//             width: 10.w,
//             color: AppColors.colorFFFFFF,
//           )),
//         ],
//       )
//     ]);
//   }
// }

// class PropertyFilterPageShimmer extends StatelessWidget {
//   const PropertyFilterPageShimmer({super.key, this.isLand = false});
//   final bool isLand;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: AppColors.colorE0E0E0,
//         enabled: true,
//         highlightColor: AppColors.colorFFFFFF,
//         child: PropertyFilterPage(isLand));
//   }
// }
