import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dokan/core/constants/app_size.dart';

import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPress;
  final Function(String)? onChanged;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final double? errorTextHeight;
  final double? hintTextSize;
  final double? height;
  final double? weight;
  final double? radius;
  final Function(String)? onSaved;
  final bool? isView;
  final bool? isEmail;
  final TextInputAction? textInputAction;

  CustomTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.onPress,
      this.errorText,
      this.prefixIconColor,
      this.suffixIconColor,
      this.fillColor,
      this.hintColor,
      this.onSaved,
      this.keyboardType,
      this.isView,
      this.isEmail,
      this.validation,
      this.prefixIconSize,
      this.onChanged,
      this.errorTextHeight,
      this.textColor,
      this.hintTextSize,
      this.height,
      this.weight,
      this.textInputAction = TextInputAction.next,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          AppColors.kOrdinaryShadow,
        ],
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        obscureText: isView != null ? isView! : false,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        textInputAction: textInputAction,
        style: kTitleMedium.copyWith(color: textColor),
        decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(
                vertical: height ?? 20.sh, horizontal: weight ?? 25.sw),
            isDense: true,
            suffixIcon: suffixIcon == null
                ? null
                : InkWell(
                    onTap: onPress,
                    child: Icon(
                      suffixIcon,
                      size: 20.r,
                      color: suffixIconColor,
                    ),
                  ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(radius ?? 30.r),
            ),
            filled: true,
            errorStyle: const TextStyle(height: 0),
            hintStyle: TextStyle(
              fontSize: hintTextSize ?? 16.sp,
              color: hintColor ?? Colors.white.withOpacity(0.4),
              fontWeight: FontWeight.w400,
            ),
            hintText: hint,
            errorText: errorText,
            fillColor: fillColor ?? Colors.white),
        validator: validation as String? Function(String?)?,
        onSaved: onSaved as String? Function(String?)?,
      ),
    );
  }
}
