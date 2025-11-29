// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:osama_core/osama_core.dart';
// import 'package:shimmer/shimmer.dart';

// class PropertyImageShimmer extends StatelessWidget {
//   final double imageHeight;
//   const PropertyImageShimmer({super.key, required this.imageHeight});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: AppColors.colorE0E0E0,
//         enabled: true,
//         highlightColor: AppColors.colorFFFFFF,
//         child: Column(
//           children: [
//             Container(
//               height: imageHeight,
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//               //clipBehavior: Clip.hardEdge,
//               decoration: const BoxDecoration(
//                 color: AppColors.colorFFFFFF,
//               ),
//               // child: Container(),
//             ),
//             //SizedBox(height: 10.h,),
//             Container(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 20.h,
//                     width: 160.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: AppColors.colorFFFFFF,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.55,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColors.colorFFFFFF,
//                         ),
//                       ),
//                       SizedBox(width: 8.w),
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.25,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColors.colorFFFFFF,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // SizedBox(height: 20.h),
//                   // Row(
//                   //   children: [
//                   //     Container(
//                   //       constraints: BoxConstraints(maxWidth: context.screenWidth * 0.5),
//                   //       color: AppColors.colorFFFFFF,
//                   //     ),
//                   //     SizedBox(width: 12.w),
//                   //     Padding(
//                   //       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   //       child: Row(
//                   //         children: [
//                   //           Container(
//                   //             height: 20.h,
//                   //             width: context.screenWidth * 0.15,
//                   //             decoration: BoxDecoration(
//                   //               borderRadius: BorderRadius.circular(10),
//                   //               color: AppColors.colorFFFFFF,
//                   //             ),
//                   //           ),
//                   //           SizedBox(width: 2.w),
//                   //           Container(
//                   //             height: 20.h,
//                   //             width: context.screenWidth * 0.35,
//                   //             decoration: BoxDecoration(
//                   //               borderRadius: BorderRadius.circular(10),
//                   //               color: AppColors.colorFFFFFF,
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(height: 20.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.15,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                       SizedBox(width: 10.w),
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 24.h),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                       SizedBox(width: 8.w),
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 24.h),
//                   Row(
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 24.h),
//                   Row(
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),

//                       SizedBox(width: 8.w),
//                       Container(
//                         height: 20.h,
//                         width: context.screenWidth * 0.35,
//                         color: AppColors.colorFFFFFF,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
