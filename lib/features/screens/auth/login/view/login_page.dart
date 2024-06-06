import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_size.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../components/default_btn.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RPadding(
        padding: REdgeInsets.symmetric(horizontal: 20.r),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                60.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                28.verticalSpace,
                Text(
                  AppStrings.signIn.tr(),
                  style: kHeadLineLarge.copyWith(
                      color: AppColors.kBlue4,
                      fontFamily: kYoungSherifFontFamily),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppStrings.signInDesc.tr(),
                  style: kTitleMedium.copyWith(color: AppColors.kYellow6),
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   AppStrings.signInDesc2,
                //   style: kTitleMedium.copyWith(color: AppColors.kYellow6),
                // ),
                40.verticalSpace,
                Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.email.tr(),
                          style: kTitleMediumBold.copyWith(
                              color: AppColors.kYellow6),
                        ),
                        8.verticalSpace,
                        CustomTextField(
                          hint: AppStrings.enterEmail.tr(),
                          hintColor: AppColors.kHintColor,
                          controller:
                          context.read<LoginCubit>().emailController,
                          isEmail: true,
                          isError:
                          state.errorStatus == ErrorStatus.emailError,
                          onChanged: (val) {
                            context.read<LoginCubit>().checkEmptyField();
                          },
                        ),
                        24.verticalSpace,
                        Text(
                          AppStrings.password.tr(),
                          style: kTitleMediumBold.copyWith(
                              color: AppColors.kYellow6),
                        ),
                        8.verticalSpace,
                        CustomTextField(
                          hint: AppStrings.password.tr(),
                          hintColor: AppColors.kHintColor,
                          controller:
                          context.read<LoginCubit>().passController,
                          isPassword: true,
                          isSecure: true,
                          isError:
                          state.errorStatus == ErrorStatus.passwordError,
                          onChanged: (val) {
                            context.read<LoginCubit>().checkEmptyField();
                          },
                        ),
                        12.verticalSpace,
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              GetContext.to(const ResetEmailScreen());
                              // Navigator.pushNamed(
                              //     context, Routes.resetPassEmail);
                            },
                            child: Text(
                              AppStrings.forgotPassword.tr(),
                              style: kLabelMediumProminent.copyWith(
                                  color: AppColors.kBlue4),
                            ),
                          ),
                        )
                      ],
                    )
                  //   },
                  // ),
                ),
                const Spacer(),
                Visibility(
                    visible: state.errorStatus == ErrorStatus.emailError ||
                        state.errorStatus == ErrorStatus.passwordError,
                    child: Text(
                      "Invalid Credential",
                      style:
                      kTitleMedium.copyWith(color: AppColors.kErrorColor),
                    )),
                32.verticalSpace,
                SizedBox(
                  width: 1.sw, //double.infinity,
                  height: AppHeight.s48,

                  child: DefaultBtn(
                    isIconEnable: false,
                    iconSpaceFromLeft: AppWidth.s33,
                    iconColor: AppColors.kWhiteColor,
                    title: AppStrings.login.tr(),
                    fontFamily: kIBMPlexSansFontFamily,
                    onPress: state.status == LoginStatus.filled
                        ? () async {
                      context.read<LoginCubit>().getLoggedIn();
                    }
                        : null,
                    btnColor: state.status == LoginStatus.filled
                        ? AppColors.kTransparentColor
                        : AppColors.kGreyDeep2Color,
                    textColor: AppColors.kWhiteColor,
                    gradient: AppColors.linearGradient,
                    radius: AppCommonSize.s8,
                    fontSize: AppTextSize.s16,
                    fontWeight: semiBoldFont,
                  ),
                ),
                42.verticalSpace,
                RichText(
                  text: TextSpan(
                    style: kRegularLine18.copyWith(
                        color: AppColors.kYellow6,
                        fontSize: AppTextSize.s12,
                        fontWeight: semiBoldFont,
                        fontFamily: kIBMPlexSansFontFamily),
                    children: [
                      TextSpan(
                        text: AppStrings.noAccount.tr(),
                      ),
                      TextSpan(
                        text: AppStrings.createAccount.tr(),
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GetContext.to(const SelectLanguageScreen());
                          },
                      ),
                    ],
                  ),
                ),
                60.verticalSpace
              ],
            );
          },
        ),
      );
    );
  }
}
