
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:osama_core/osama_core.dart';
// import 'package:shimmer/shimmer.dart';

// class ProjectFilterPage extends StatelessWidget {
//   const ProjectFilterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(

//         children: [
//           Container(height: 52.h,width: double.infinity,color: AppColors.colorFFFFFF,),
//           SizedBox(
//             height: 23.h,
//           ),
//           Container(height: 52.h,width: double.infinity,color: AppColors.colorFFFFFF,),
//           SizedBox(
//             height: 23.h,
//           ),
//           Container(height: 52.h,width: double.infinity,color: AppColors.colorFFFFFF,),
//          SizedBox(height: 64.h,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                       child: Container(
//                         height: 41.h,
//                         width: 10.w,
//                         color: AppColors.colorFFFFFF,
//                       )),
//                   SizedBox(
//                     width: 12.w,
//                   ),
//                   Expanded(
//                       child: Container(
//                         height: 41.h,
//                         width: 10.w,
//                         color: AppColors.colorFFFFFF,
//                       )),
//                 ],
//               )
//         ]);
//   }
// }

// class ProjectFilterPageShimmer extends StatelessWidget {
//   const ProjectFilterPageShimmer({super.key, this.isHorizontalList = false});
//   final bool isHorizontalList;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: AppColors.colorE0E0E0,
//         enabled: true,
//         highlightColor: AppColors.colorFFFFFF,
//         child: const ProjectFilterPage());
//   }
// }
