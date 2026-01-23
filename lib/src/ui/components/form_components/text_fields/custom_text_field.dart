import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class CustomAppTextField extends StatefulWidget {
  const CustomAppTextField({
    super.key = const Key("CustomAppTextField"),
    this.validator,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.suffix,
    this.prefix,
    this.onTap,
    this.focusNode,
    this.isReadOnly = false,
    this.enabled = true,
    this.inputFormatters,
    this.textInputAction,
    this.inputType,
    this.suffixIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.autoUnFocus = true,
    this.textDirection,
    this.hintTextDirection,
    this.maxLines,
    this.autoValidateMode,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.hasError = false,
    this.suffixText,
    this.suffixStyle,
    this.onFocusChanged,
    this.backgroundColor,
  });

  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool isReadOnly;
  final bool enabled;
  final bool obscureText;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final bool autofocus;
  final TextDirection? textDirection;
  final TextDirection? hintTextDirection;
  final TextAlign textAlign;
  final bool autoUnFocus;
  final int? maxLines;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final bool hasError;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final void Function(bool)? onFocusChanged;
  final Color? backgroundColor;

  @override
  State<CustomAppTextField> createState() => _CustomAppTextFieldState();
}

class _CustomAppTextFieldState extends State<CustomAppTextField> {
  bool _hasFocus = false;

  late final FocusNode _focusNode;

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
        widget.onFocusChanged?.call(true);
        _hasFocus = true;
      });
    } else if (!_focusNode.hasFocus && _hasFocus) {
      setState(() {
        widget.onFocusChanged?.call(false);
        _hasFocus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTextField(
      focusNode: _focusNode,
      hasFocus: _hasFocus,
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      prefix: widget.prefix,
      suffix: widget.suffix,
      isReadOnly: widget.isReadOnly,
      enabled: widget.enabled,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      autoFocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.inputType,
      suffixIcon: widget.suffixIcon,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      hintTextDirection: widget.hintTextDirection,
      textDirection: widget.textDirection,
      autoUnFocus: widget.autoUnFocus,
      context: context,
      maxLines: widget.maxLines,
      autoValidateMode: widget.autoValidateMode,
      initialValue: widget.initialValue,
      hasError: widget.hasError,
      suffixText: widget.suffixText,
      suffixStyle: widget.suffixStyle,
      onFocusChanged: widget.onFocusChanged,
      backgroundColor: widget.backgroundColor,
    );
  }
}

class _CustomTextField extends FormField<String> {
  _CustomTextField({
    required FocusNode focusNode,
    required bool isReadOnly,
    required bool enabled,
    required bool autoFocus,
    required TextAlign textAlign,
    required bool autoUnFocus,
    required BuildContext context,
    super.validator,
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    bool hasFocus = false,
    bool obscureText = false,
    void Function(String)? onChanged,
    Widget? suffix,
    Widget? suffixIcon,
    Widget? prefix,
    VoidCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    TextDirection? hintTextDirection,
    int? maxLines,
    AutovalidateMode? autoValidateMode,
    String? initialValue,
    String? suffixText,
    TextStyle? suffixStyle,
    bool hasError = false,
    Function(bool)? onFocusChanged,
    Color? backgroundColor,
  }) : super(
          key: const Key("_CustomTextField"),
          autovalidateMode: autoValidateMode,
          builder: (state) {
            if (controller != null) {
              controller.addListener(() {
                state.didChange(controller.text);
              });
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              key: const Key("CustomTextFieldColumn"),
              children: [
                Container(
                  key: const Key("CustomTextFieldContainer"),
                  decoration: ShapeDecoration(
                    color: enabled
                        ? (state.hasError || hasError)
                            ? AppColors.lightErrorColor
                            : backgroundColor ?? Colors.white
                        : AppColors.basicBorderColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: (state.hasError || hasError)
                            ? AppColors.errorColor
                            : hasFocus
                                ? AppColors.mainPrimary
                                : AppColors.basicBorderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: (state.hasError || hasError)
                            ? AppColors.errorColor.withOpacity(0.17)
                            : hasFocus
                                ? AppColors.mainPrimary.withOpacity(0.14)
                                : AppColors.colorC4C4C4.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    key: const Key("CustomTextFieldRow"),
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: const Key("CustomTextFieldFormField"),
                          controller: controller,
                          focusNode: focusNode,
                          onTap: onTap,
                          obscureText: obscureText,
                          textDirection: textDirection,
                          initialValue: initialValue,
                          maxLines: obscureText ? 1 : maxLines,
                          onTapOutside: (_) {
                            if (autoUnFocus) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          onChanged: (value) {
                            state.didChange(value);
                            onChanged?.call(value);
                            if (state.hasError) {
                              // Future.delayed(const Duration(milliseconds: 100), () {
                              state.validate();
                              // });
                            }
                          },
                          style: FontFamilyStyle.standardTextStyleW500(
                              fontSize: 14.sp,
                              lineHeight: 21 / 12,
                              color: AppColors.mainText),
                          cursorColor: AppColors.mainPrimary,
                          cursorHeight: 14.h,
                          readOnly: isReadOnly,
                          enabled: enabled,
                          inputFormatters: inputFormatters,
                          keyboardType: keyboardType,
                          textInputAction: textInputAction,
                          autofocus: autoFocus,
                          textAlign: textAlign,
                          decoration: InputDecoration(
                            alignLabelWithHint: maxLines != null && maxLines > 1
                                ? false
                                : null, // Don't align for multi-line
                            floatingLabelBehavior: maxLines != null &&
                                    maxLines > 1
                                ? FloatingLabelBehavior.always
                                : null, // Always show label for multi-line
                            floatingLabelAlignment: maxLines != null &&
                                    maxLines > 1
                                ? FloatingLabelAlignment
                                    .start // Position at top-right for multi-line
                                : null,
                            labelText: labelText,
                            hintText: hintText,
                            hintTextDirection: hintTextDirection,
                            filled: false,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
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
                            suffix: suffixIcon,
                            prefix: prefix,
                            suffixText: suffixText,
                            suffixStyle: suffixStyle,
                          ),
                        ),
                      ),
                      if (suffix != null) ...[
                        SizedBox(width: 16.w),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: suffix,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                if (state.hasError)
                  AppErrorWidget(
                    key: const Key("CustomTextFieldAppErrorWidget"),
                    state.hasError,
                    state.errorText ?? "",
                    img: CoreAppSvg.redWarningCircle,
                  ),
              ],
            );
          },
        );
}
