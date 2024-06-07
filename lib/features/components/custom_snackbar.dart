import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

Future<void> showCustomSnackBar({
  required BuildContext context,
  String? message,
  bool isError = false,
  bool isCenterText = false,
}) async{
  Flushbar(
    icon: isError
        ? const SizedBox.shrink()
        : RPadding(
            padding: REdgeInsets.all(8.0),
            child: Container(
              //constraints: const BoxConstraints(maxHeight: 16.0,maxWidth: 16.0),
              width: 30.0.w,
              height: 30.0.h,
              decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(30).r),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.red,
                  size: 15.r,
                ),
              ),
            ),
          ),
    message: message ?? "",
    mainButton: isError
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: Icon(
                Icons.clear,
                color: AppColors.kWhiteColor,
                size: 22.r,
              ),
            ),
          )
        : const SizedBox.shrink(),
    duration: const Duration(seconds: 3),
    margin: REdgeInsets.all(8.0),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    //messageColor: isError ? AppColors.kWhiteColor : AppColors.kRichBlack900,
    messageColor: AppColors.kWhiteColor,
    textDirection: Directionality.of(context),

    borderRadius: BorderRadius.circular(8).r,
    //backgroundColor: isError ? AppColors.kPrimaryRed : AppColors.kPrimaryRedColor,
    backgroundColor: AppColors.kPrimaryColor,
  ).show(context);
}
