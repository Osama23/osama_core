import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class PdfListTile extends StatelessWidget {
  const PdfListTile({
    super.key,
    required this.fileUrl,
    required this.fileName,
    required this.onTap,
  });

  final String fileUrl;
  final String fileName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16.h),
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorF8F8F8,
              ),
              child: Center(
                child: ImageView(
                  CoreAppSvg.pdf,
                  ImageType.svg,
                  height: 24.h,
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Align(
                alignment: Localizations.localeOf(context).languageCode == 'en'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            '${snapshot.data}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontSize: 12.sp),
                          );
                        } else if (snapshot.hasError ||
                            ((snapshot.data)?.isEmpty ?? true)) {
                          return const SizedBox.shrink();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      future: FileHandlerUtil.getFileSize(fileUrl, context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            InkWell(
              onTap: onTap,
              child: SizedBox(
                height: 30.h,
                child: Center(
                  child: Text(
                    context.l10n.view,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 14.sp, color: AppColors.color6C6DB5),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
