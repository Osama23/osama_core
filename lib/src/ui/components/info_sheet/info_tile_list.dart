import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class InfoTileList extends StatelessWidget {
  const InfoTileList({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      minLeadingWidth: 12,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 32.w,
        height: 32.w,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.moreLightSecondaryColor,
        ),
        child: FittedBox(
          child: SvgPicture.asset(
            icon,
            theme: const SvgTheme(currentColor: AppColors.secondaryColor),
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppFonts.bodyMedium14px.mainTextColor,
      ),
      subtitle: Text(
        subtitle,
        style: AppFonts.bodyRegular12px.secondTextColor,
      ),
    );
  }
}
