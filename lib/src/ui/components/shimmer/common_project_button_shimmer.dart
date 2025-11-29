// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:osama_core/osama_core.dart';
// import 'package:shimmer/shimmer.dart';

// class CommonDetailsButtonShimmer extends StatelessWidget {
//   const CommonDetailsButtonShimmer({super.key, this.isProperty = false, this.bottomSpace = 5});

//   final bool isProperty;
//   final double bottomSpace;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(
//             left: 24.w,
//             right: 24.w,
//             top: 10.h, bottom: bottomSpace),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             if(!isProperty)
//             Expanded(
//               child: Shimmer.fromColors(
//                 baseColor: AppColors.colorE0E0E0,
//                 enabled: true,
//                 highlightColor: AppColors.colorFFFFFF,
//                 child: Container(
//                   height: 46.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.colorFFFFFF,
//                       borderRadius: BorderRadius.circular(15)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 11.w,
//             ),
//             Expanded(
//               child: Shimmer.fromColors(
//                 baseColor: AppColors.colorE0E0E0,
//                 enabled: true,
//                 highlightColor: AppColors.colorFFFFFF,
//                 child: Container(
//                   height: 46.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.colorFFFFFF,
//                       borderRadius: BorderRadius.circular(15)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
