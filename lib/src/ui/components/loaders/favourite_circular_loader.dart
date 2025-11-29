import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class FavouriteCircularLoader extends StatelessWidget {
  final bool isPropertyList;
  const FavouriteCircularLoader({this.isPropertyList = false,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
      child: const Center(
          child: CircularProgressIndicator(color: AppColors.colorEBDD36,strokeWidth: 2.0,)),
    );
  }
}
