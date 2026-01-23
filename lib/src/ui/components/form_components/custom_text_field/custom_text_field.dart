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
    this.textAlign = TextAlign.start,
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
      backgroundColor: widget.backgroundColor,
    );
  }
}

class _CustomTextField extends FormField<String> {
  _CustomTextField({
    required FocusNode focusNode,
    required bool isReadOnly,
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
    Color? backgroundColor,
  }) : super(
         key: const Key("_CustomTextField"),
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
                   color:
                       state.hasError
                           ? AppColors.lightErrorColor
                           : backgroundColor ?? Colors.white,
                   shape: RoundedRectangleBorder(
                     side: BorderSide(
                       color:
                           state.hasError
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
                       color:
                           state.hasError
                               ? AppColors.errorColor.withValues(alpha: 0.17)
                               : hasFocus
                               ? AppColors.mainPrimary.withValues(alpha: 0.14)
                               : AppColors.colorC4C4C4.withValues(alpha: 0.1),
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
                         maxLines: obscureText ? 1 : maxLines,
                         onTapOutside: (_) {
                           if (autoUnFocus) {
                             FocusScope.of(context).unfocus();
                           }
                         },
                         onChanged: (value) {
                           state.didChange(value);
                           onChanged?.call(value);
                         },
                         style: FontFamilyStyle.standardTextStyleW500(
                           fontSize: 14.sp,
                           lineHeight: 21 / 12,
                           color: AppColors.mainText,
                         ),
                         cursorColor: AppColors.mainPrimary,
                         cursorHeight: 14.h,
                         readOnly: isReadOnly,
                         inputFormatters: inputFormatters,
                         keyboardType: keyboardType,
                         textInputAction: textInputAction,
                         autofocus: autoFocus,
                         textAlign: textAlign,
                         decoration: InputDecoration(
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
