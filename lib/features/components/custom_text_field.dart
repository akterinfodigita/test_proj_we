import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_size.dart';
import '../../generated/assets.dart';
import 'custom_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPress;
  final VoidCallback? fieldClick;
  final Function(String)? onChanged;

  // final InputDecoration? decoration = const InputDecoration();
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
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
  final bool? isEmail;
  final bool isPassword;
  final bool isSecure;
  final bool isForHeight;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextStyle? errorStyle;
  final Color? underLineBorderColor;
  final FocusNode? focusNode;
  final bool isError;
  final TextStyle? textStyle;
  final int maxLength;
  final int maxLines;

  const CustomTextField({
    super.key,
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
    this.isEmail,
    this.validation,
    this.prefixIconSize,
    this.onChanged,
    this.errorTextHeight,
    this.textColor,
    this.hintTextSize,
    this.height,
    this.weight,
    this.radius,
    this.fieldClick,
    this.borderColor,
    this.isPassword = false,
    this.isSecure = false,
    this.readOnly = false,
    this.isForHeight = false,
    this.textInputAction = TextInputAction.next,
    this.errorStyle,
    this.underLineBorderColor,
    this.focusNode,
    this.isError = false,
    this.textStyle,
    this.maxLength = 200,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = widget.isSecure;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      textAlign: TextAlign.start,
      obscureText: isVisible,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      style: widget.textStyle ??
          kTitleSmall.copyWith(
            color: widget.textColor ?? AppColors.kBlackColor,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
      onTap: widget.fieldClick ?? () {},
      inputFormatters: [
        if (widget.keyboardType == TextInputType.number) ...[
          widget.isForHeight
              ? FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d?\d?$'))
              : FilteringTextInputFormatter.deny(RegExp(r'[.,]')),
          //FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
        ] else if (widget.keyboardType == TextInputType.text) ...[
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9 ]*")),
        ]
      ],
      decoration: InputDecoration(
        contentPadding: REdgeInsets.symmetric(
            vertical: widget.height ?? 17, horizontal: widget.weight ?? 16),
        counter: const Offstage(),
        isDense: false,
        suffixIconConstraints: BoxConstraints.tight(
          Size(
            50.w,
            50.h,
          ),
        ),
        suffixIcon: widget.isPassword
            ? RPadding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: InkWell(
                  onTap: _toggleVisibility,
                  child: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    size: 16,
                    color: AppColors.kGrayColor,
                  ),
                ),
              )
            : widget.suffixIcon == null
                ? null
                : InkWell(
                    onTap: widget.onPress,
                    child: widget.suffixIcon,
                  ),
        prefixIconConstraints: BoxConstraints.tight(
          Size(
            widget.prefixIconSize ?? 50.w,
            widget.prefixIconSize ?? 50.h,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.isError
                  ? AppColors.kErrorColor
                  : widget.borderColor ?? AppColors.kWhiteColor,
              width: 1.0.w),
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.isError
                  ? AppColors.kErrorColor
                  : widget.borderColor ?? AppColors.kWhiteColor,
              width: 1.0.w),
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
        ),
        filled: true,
        errorStyle: widget.errorStyle ?? const TextStyle(height: 0),
        hintStyle: TextStyle(
          fontSize: widget.hintTextSize ?? 16.sp,
          color: widget.hintColor ?? AppColors.kWhiteColor.withOpacity(0.4),
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hint,
        errorText: widget.errorText,
        fillColor: widget.fillColor ?? AppColors.kWhiteColor,
      ),
      validator: widget.validation as String? Function(String?)?,
      onSaved: widget.onSaved as String? Function(String?)?,
    );
  }
}
