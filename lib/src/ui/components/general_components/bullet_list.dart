import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';

class BulletList extends StatelessWidget {
  const BulletList({
    super.key,
    required this.content,
    this.isOrdered = false,
    this.textStyle,
  });

  final String content;
  final bool isOrdered;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getLines.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isOrdered
                ? Text(
                    "${(index + 1).toString()}.",
                    style: textStyle ??
                        context.textTheme.labelSmall?.copyWith(
                          fontSize: 12.sp,
                          height: 18 / 12,
                          color: AppColors.mainText,
                        ),
                    textAlign: TextAlign.start,
                  )
                : const CircleAvatar(radius: 4),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                getLines[index],
                style: textStyle ??
                    context.textTheme.labelSmall?.copyWith(
                      fontSize: 12.sp,
                      height: 18 / 12,
                      color: AppColors.mainText,
                    ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        );
      },
    );
  }

  List<String> get getLines {
    return content.split("\n");
  }
}
