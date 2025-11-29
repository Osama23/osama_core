import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class CircularIconWithBackground extends StatelessWidget {
  const CircularIconWithBackground({
    super.key,
    required this.icon,
    required this.size,
    this.isSelected = false,
    this.padding = 8,
    this.isNetwork = false,
  });

  final String icon;
  final double size;
  final bool isSelected;
  final double padding;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.secondaryColor
            : AppColors.moreLightSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: ImageView(
        icon,
        isNetwork ? ImageType.url : ImageType.svg,
        fit: BoxFit.fill,
        width: double.infinity,
        imageColor: isSelected ? Colors.white : AppColors.secondaryColor,
      ),
    );
  }
}
