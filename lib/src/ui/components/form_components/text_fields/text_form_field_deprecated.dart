import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osama_core/osama_core.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  bool isPasswordVisible = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines = 1,
  bool isPayment = false,
  required String hint,
  bool isReadOnly = false,
  int? numberOfCharacters = 100,
  Color borderColor = AppColors.colorEBDD36,
  bool hasError = false,
  Color suffixColor = AppColors.color4C4C4C,
  FocusNode? focusNode,
  Color hintColor = AppColors.color1C1B13,
  List<TextInputFormatter>? inputFormats,
  bool autoFocus = false,
  InputBorder? focusBorder,
  EdgeInsets? padding,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword ? !isPasswordVisible : false,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  maxLines: lines,
  validator: validate,
  readOnly: isReadOnly,
  focusNode: focusNode,
  autofocus: autoFocus,
  style: FontFamilyStyle.standardTextStyleW500(
    fontSize: 14.sp,
    color: AppColors.color1C1B13,
  ),
  cursorColor: borderColor,

  inputFormatters: [
    LengthLimitingTextInputFormatter(numberOfCharacters),
    ...(inputFormats ?? []),
  ],
  decoration:
      isPayment
          ? InputDecoration(
            // border: InputBorder.none,
            labelText: label,
          )
          : InputDecoration(
            labelText: label,
            labelStyle: FontFamilyStyle.standardTextStyleW400(
              fontSize: 14.sp,
              color: AppColors.colorB6B6B4,
            ),
            hintText: hint,
            alignLabelWithHint: true,
            suffixIcon:
                isPassword // controller.text.isNotEmpty
                    ? IconButton(
                      icon:
                          isPasswordVisible
                              ? Icon(Icons.visibility, color: suffixColor)
                              : Icon(Icons.visibility_off, color: suffixColor),
                      onPressed: suffixPressed,
                    )
                    : IconButton(
                      onPressed: suffixPressed,
                      icon: Icon(suffix, color: suffixColor, size: 36.h),
                    ),
            hintStyle: FontFamilyStyle.standardTextStyleW500(
              fontSize: 12.sp,
              color: hintColor,
            ),
            // TextStyle(color: AppColors.colorB6B6B4, fontSize: 10.sp),
            filled: true,
            errorStyle: FontFamilyStyle.standardTextStyleW400(
              fontSize: 12.sp,
              color: AppColors.colorEF3B53,
            ),
            fillColor:
                hasError ? AppColors.lightErrorColor : AppColors.colorFFFFFF,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 8.h,
            ),
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(15.w)),
            //   borderSide: BorderSide(color: borderColor, width: 1),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(15.w,)),
            //   borderSide: BorderSide(color: borderColor, width: 1),
            //   //  borderSide: BorderSide(color: accentColor, width: 1),
            // ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(15.w,),),
            //   borderSide: const BorderSide(color: AppColors.colorE92727, width: 1),
            // ),
            // focusedErrorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(15.w,),),
            //   borderSide: const BorderSide(color: AppColors.colorE92727, width: 1),
            // ),
          ),
);
