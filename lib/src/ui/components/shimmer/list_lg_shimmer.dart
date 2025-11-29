import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key,this.isHorizontalList=false,this.count, this.havePadding = true});
  final bool isHorizontalList;
  final int? count;
  final bool havePadding;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorE0E0E0,
      enabled: true,
      highlightColor: AppColors.colorFFFFFF,
      child: ListView.builder(
        shrinkWrap: true,
        padding: havePadding ? null : EdgeInsets.zero,
        itemBuilder: (BuildContext context, int pos) {
          if (isHorizontalList) {
            return const ShimmerListItemH();
          }
          return const ShimmerListItemV();
        },
        itemCount: count ?? (isHorizontalList ? 10 : 5),
      ),
    );
  }
}

class ShimmerListItemV extends StatelessWidget {
  const ShimmerListItemV({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.colorFFFFFF,
                ),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                height: 231,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 3, left: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.colorFFFFFF,
                      ),
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colorFFFFFF,
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.colorFFFFFF,
                ),
                margin: const EdgeInsets.only(top: 4.0, bottom: 3, left: 5),
                height: 15,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ]));
  }
}

class ShimmerListItemH extends StatelessWidget {
  const ShimmerListItemH({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 117,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.colorFFFFFF,
                ),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                height: 117,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 3, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.colorFFFFFF,
                        ),
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.26,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.colorFFFFFF,
                        ),
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.colorFFFFFF,
                        ),
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.colorFFFFFF,
                            ),
                            height: 15,
                            width: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.colorFFFFFF,
                            ),
                            height: 15,
                            width: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.colorFFFFFF,
                            ),
                            height: 15,
                            width: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }
}

class SearchShimmerList extends StatelessWidget {
  const SearchShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorE0E0E0,
      enabled: true,
      highlightColor: AppColors.colorFFFFFF,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int pos) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(25.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.colorFFFFFF,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.colorFFFFFF,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.colorFFFFFF,
                    ),
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
