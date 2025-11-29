import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    this.autoFocus = false,
    this.suffix,
    this.prefixText = '',
    this.onTap,
    this.maxLength,
    this.showPrefix = false,
    this.onChange,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.obscureText = false,
    this.inputFormatters,
    this.padding,
    this.initialValue,
    this.inputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.textStyle,
    this.labelText,
    this.validator,
    this.textEditingController,
    this.disabledBorderColor,
    this.unfocusedBorderColor,
    this.focusedBorderColor,
    this.isEnabled = true,
    this.constraints,
    this.hintText,
    this.keyboardType = TextInputType.text,
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.contentPadding,
    this.errorBorder,
    this.fillColor,
    this.isFilled,
    this.labelStyle,
    this.hintTextDirection,
  });
  final String? hintText;
  final String? labelText;
  final BoxConstraints? constraints;
  final bool isEnabled;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final Color? disabledBorderColor;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final void Function(String? value)? onFieldSubmitted;
  final TextInputAction? inputAction;
  final String? initialValue;
  final EdgeInsetsGeometry? padding;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextDirection? hintTextDirection;
  final void Function(String)? onChange;
  final VoidCallback? onTap;
  final int? maxLength;
  final Widget? suffix;
  final bool obscureText;
  final bool showPrefix;
  final String prefixText;
  final bool autoFocus;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool? isFilled;
  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late FocusNode _focusNode;
  late ThemeData theme;
  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }

  // returns the text style of common text field
  TextStyle getLabelStyle({bool isError = false}) {
    return (theme.textTheme.labelMedium?.copyWith(
      color:
          isError
              ? AppColors.errorColor
              : _focusNode.hasFocus
              ? (widget.focusedBorderColor ?? theme.primaryColor)
              : (widget.unfocusedBorderColor ??
                  widget.disabledBorderColor ??
                  theme.disabledColor),
    ))!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? AppDimensions.all0,
      child: InkWell(
        onTap: widget.onTap,
        child: TextFormField(
          autofocus: widget.autoFocus,
          maxLength: widget.maxLength,
          onChanged: widget.onChange,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          initialValue: widget.initialValue,
          validator: widget.validator,
          controller: widget.textEditingController,
          focusNode: _focusNode,
          cursorColor: theme.primaryColor,
          style: widget.textStyle,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          textInputAction: widget.inputAction,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText,
          readOnly: !widget.isEnabled,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            suffix: widget.suffix,
            contentPadding: widget.contentPadding ?? AppDimensions.onlyB10,
            constraints: widget.constraints,
            prefix:
                widget.showPrefix
                    ? Text(
                      '${widget.prefixText} ',
                      style: theme.textTheme.labelMedium?.copyWith(
                        height: 1.5,
                        color: AppColors.color909090,
                      ),
                    )
                    : null,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: theme.textTheme.labelMedium?.copyWith(height: 1.5),
            labelStyle: widget.labelStyle ?? getLabelStyle(),
            errorMaxLines: 8,
            alignLabelWithHint: true,
            focusedBorder:
                widget.focusedBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.focusedBorderColor ?? theme.primaryColor,
                    width: 1.w,
                  ),
                ),
            enabledBorder:
                widget.enabledBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.unfocusedBorderColor ?? theme.disabledColor,
                    width: 1.w,
                  ),
                ),
            disabledBorder:
                widget.disabledBorder ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.disabledBorderColor ?? theme.disabledColor,
                    width: 1.w,
                  ),
                ),
            errorBorder: widget.errorBorder,
            errorStyle: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.errorColor,
            ),
            focusedErrorBorder: widget.errorBorder,
            fillColor: widget.fillColor,
            filled: widget.isFilled,
            hintTextDirection: widget.hintTextDirection,
          ),
        ),
      ),
    );
  }
}
