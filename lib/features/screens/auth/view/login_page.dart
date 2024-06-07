import 'package:dokan/features/components/custom_image.dart';
import 'package:dokan/features/components/custom_svg.dart';
import 'package:dokan/features/components/default_btn.dart';
import 'package:dokan/features/screens/auth/view/register_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/strings.dart';

import '../../../../core/app/app_context.dart';
import '../../../components/custom_text_field.dart';
import '../cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: RPadding(
          padding: REdgeInsets.symmetric(horizontal: 20.r),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.verticalSpace,
                  CustomImage(
                    baseUrl:
                        "https://helwp.com/wp-content/uploads/dokan-logo.webp",
                    // size: 50,
                    height: 50,
                    width: 200,
                  ),
                  100.verticalSpace,
                  Text(
                    AppStrings.signIn.tr(),
                    style: kHeadLineLarge.copyWith(
                      color: AppColors.kBlackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  40.verticalSpace,
                  CustomTextField(
                    controller: context.read<AuthCubit>().loginEmailController,
                    isEmail: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    hint: AppStrings.email.tr(),
                    hintColor: AppColors.kGrayColor,
                    onChanged: (val) {},
                    borderColor: AppColors.kPrimaryColor,
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: context.read<AuthCubit>().loginPassController,
                    prefixIcon: Icon(Icons.lock_outline),
                    isPassword: true,
                    isSecure: true,
                    hint: AppStrings.password.tr(),
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
                    AppStrings.signIn.tr(),
                    color: AppColors.kPrimaryColor,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    tap: () {
                      context.read<AuthCubit>().getLoggedIn();
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      GetContext.to(RegistrationPage());
                    },
                    child: Text(
                      AppStrings.createNew.tr(),
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
