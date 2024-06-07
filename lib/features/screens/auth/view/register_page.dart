import 'package:dokan/core/app/app_context.dart';
import 'package:dokan/features/components/custom_svg.dart';
import 'package:dokan/features/screens/auth/view/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../generated/assets.dart';
import '../../../components/custom_image.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/default_btn.dart';
import '../cubit/auth_cubit.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kGrayColor50,
        body: RPadding(
          padding: REdgeInsets.symmetric(horizontal: 20.r),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.verticalSpace,
                  CustomSvg(
                    icon: Assets.iconsProfile,
                    size: 200,
                  ),
                  40.verticalSpace,
                  CustomTextField(
                    controller: context.read<AuthCubit>().nameController,
                    isEmail: true,
                    prefixIcon: Icon(Icons.person),
                    hint: AppStrings.name.tr(),
                    hintColor: AppColors.kGrayColor,
                    onChanged: (val) {},
                    borderColor: AppColors.kPrimaryColor,
                  ),
                  CustomTextField(
                    controller: context.read<AuthCubit>().emailController,
                    isEmail: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    hint: AppStrings.email.tr(),
                    hintColor: AppColors.kGrayColor,
                    onChanged: (val) {},
                    borderColor: AppColors.kPrimaryColor,
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: context.read<AuthCubit>().passController,
                    prefixIcon: Icon(Icons.lock_outline),
                    hint: AppStrings.password,
                    hintColor: AppColors.kGrayColor,
                    borderColor: AppColors.kPrimaryColor,
                    onChanged: (val) {},
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: context.read<AuthCubit>().confirmPassController,
                    prefixIcon: Icon(Icons.lock_outline),
                    hint: AppStrings.confirmPass,
                    hintColor: AppColors.kGrayColor,
                    borderColor: AppColors.kPrimaryColor,
                    onChanged: (val) {},
                  ),
                  12.verticalSpace,
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        AppStrings.forgotPassword.tr(),
                      ),
                    ),
                  ),
                  100.verticalSpace,
                  AppBtn(
                    AppStrings.signUp.tr(),
                    color: AppColors.kPrimaryColor,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    tap: () {
                      context.read<AuthCubit>().getRegister();
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      GetContext.back();
                    },
                    child: Text(
                      AppStrings.haveAccount.tr(),
                      style: kTitleLarge.copyWith(color: AppColors.kGrayColor),
                    ),
                  ),
                  50.verticalSpace,
                ],
              );
            },
          ),
        ));
  }
}
