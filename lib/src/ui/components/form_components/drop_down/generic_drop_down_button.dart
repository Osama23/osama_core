import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osama_core/osama_core.dart';

class GenericDropDownButton<T> extends StatefulWidget {
  const GenericDropDownButton({
    super.key,
    this.labelText,
    this.onChanged,
    this.hintText,
    this.selectedItem,
    this.validator,
    required this.items,
    this.focusNode,
    this.isLoading = false,
    this.isRequired = true,
  });

  final String? labelText;
  final List<GenericDropdownMenuItem<T>> items;
  final String? hintText;
  final T? selectedItem;
  final FocusNode? focusNode;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isLoading;
  final bool isRequired;

  @override
  State<GenericDropDownButton<T>> createState() =>
      _GenericDropDownButtonState<T>();
}

class _GenericDropDownButtonState<T> extends State<GenericDropDownButton<T>> {
  bool _hasFocus = false;

  late final FocusNode _focusNode;
  T? _selectedValue;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_checkFocus);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_checkFocus);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _checkFocus() {
    if (_focusNode.hasFocus && !_hasFocus) {
      setState(() {
        _hasFocus = true;
      });
    } else if (!_focusNode.hasFocus && _hasFocus) {
      setState(() {
        _hasFocus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: ShapeDecoration(
                color:
                    state.hasError ? AppColors.lightErrorColor : Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: state.hasError
                        ? AppColors.errorColor
                        : _hasFocus
                            ? AppColors.mainPrimary
                            : AppColors.basicBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: state.hasError
                        ? AppColors.errorColor.withOpacity(0.17)
                        : _hasFocus
                            ? AppColors.mainPrimary.withOpacity(0.14)
                            : AppColors.colorC4C4C4.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<T>(
                      borderRadius: BorderRadius.circular(4),
                      hint: widget.hintText != null
                          ? Text(widget.hintText!,
                              style: context.textTheme.labelSmall?.copyWith(
                                color: AppColors.secondText,
                                fontSize: 12.sp,
                              ))
                          : null,
                      value: _selectedValue,
                      validator: widget.isRequired
                          ? (value) => value == null
                              ? context.l10n.requiredField
                              : null
                          : null,
                      focusNode: widget.focusNode,
                      isExpanded: true,
                      icon: const SizedBox.shrink(),
                      onChanged: widget.onChanged,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.mainText,
                            fontSize: 14.sp,
                          ),
                      decoration: InputDecoration(
                        labelText: widget.labelText,
                        hintText: widget.hintText,
                        filled: false,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        labelStyle: FontFamilyStyle.standardTextStyleW400(
                          fontSize: 14.sp,
                          lineHeight: 18 / 12,
                          color: AppColors.placeHolderColor,
                        ),
                        hintStyle: FontFamilyStyle.standardTextStyleW400(
                          fontSize: 14.sp,
                          lineHeight: 21 / 12,
                          color: AppColors.placeHolderColor,
                        ),
                        border: InputBorder.none,
                        // prefix: prefix,
                      ),
                      items: widget.items
                          .map((e) => DropdownMenuItem(
                                value: e.value,
                                enabled: e.isEnabled,
                                child: Text(e.title),
                              ))
                          .toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 24),
                      child: SvgPicture.asset(
                        "assets/svg/arrow_down_sharp.svg",
                        width: 24.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.placeHolderColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            AppErrorWidget(
              state.hasError,
              state.errorText ?? "",
              img: CoreAppSvg.redWarningCircle,
            ),
          ],
        );
      },
    );
  }
}
