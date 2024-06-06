import 'package:flutter/material.dart';

class AppBtn extends StatelessWidget {
  const AppBtn(
    this.title, {
    super.key,
    this.tap,
    this.color,
    this.gradient,
    this.border,
    this.textStyle,
    this.prefixIcon,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.margin,
  });

  final String title;
  final VoidCallback? tap;
  final Color? color;
  final Gradient? gradient;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final decoration = this.decoration ??
        BoxDecoration(
          color: color ?? const Color(0xFFB8B3AC),
          borderRadius: BorderRadius.circular(8),
          border: border,
        );

    final buttonStyle = ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Colors.transparent,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );

    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: TextButton(
        onPressed: tap,
        style: buttonStyle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (prefixIcon != null)
              SizedBox(
                width: 16,
              ),
            if (prefixIcon != null) prefixIcon!,
            Expanded(
              child: Text(title, textAlign: TextAlign.center, style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
