import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/strings.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/default_btn.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.forgotPasswordTitle,
                style: kHeadLineLarge.copyWith(
                  color: AppColors.kSecondaryRichBlackColor,
                ),
              ),
              25.verticalSpace,
              Text(
                AppStrings.forgotPasswordDesc,
                style: kTitleMedium.copyWith(
                  color: AppColors.kSecondaryRichBlackColor,
                ),
              ),
              30.verticalSpace,
              Text(
                AppStrings.forgetEmail,
                style: kTitleMedium.copyWith(
                  color: AppColors.kSecondaryRichBlackColor,
                ),
              ),
              CustomTextField(
                controller: emailController,
                hint: AppStrings.forgetEmailHint,
                fillColor: AppColors.kWhiteColor,
                validation: (value) {
                  if (value.isEmpty) {
                    return kEmailNullError;
                  }
                  if (!emailValidatorRegExp.hasMatch(value)) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
              ),
              Text(
                'Password',
                style: kTitleMedium.copyWith(
                  color: AppColors.kSecondaryRichBlackColor,
                ),
              ),
              CustomTextField(
                controller: passwordController,
                hint: 'password',
                fillColor: AppColors.kWhiteColor,
                validation: (value) {
                  if (value.isEmpty) {
                    return kPassNullError;
                  }
                  if (value.length < 4) {
                    return kShortPassError;
                  }
                  return null;
                },
              ),
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: DefaultBtn(
                  title: AppStrings.forgotPasswordSubmit,
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
