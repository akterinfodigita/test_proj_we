import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dokan/features/router/routes.dart';
import 'package:dokan/features/screens/auth/view/login_page.dart';
import 'package:dokan/features/screens/dashboard/view/dashboard_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/app/app_preference.dart';
import '../../../../core/app/app_context.dart';
import '../../../../core/app/app_dependency.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/progress_loader.dart';
import '../repository/auth_repository_impl.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AppPreferences _appPreferences;
  AuthRepositoryImpl authRepositoryImpl;
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  AuthCubit(this.authRepositoryImpl)
      : _appPreferences = instance.get(),
        super(AuthState());

  bool rememberMe = false;

  Future<void> getLoggedIn() async {
    showProgressDialog();
    final response = await authRepositoryImpl.getLogin({
      'username': loginEmailController.text.toString(),
      'password': loginPassController.text.toString(),
    });

    dismissProgressDialog();
    response.fold(
      (failure) {
        if (failure.code == 302) {
          debugPrint('my failure code : ${failure.code}');
        }
        showCustomSnackBar(
            context: GetContext.context,
            isError: true,
            message: failure.message);
      },
      (data) async {
        _appPreferences.setUserAuthToken(data.token);
        _appPreferences.saveUserData(data);
        getUserId(data.token ?? "");
        _appPreferences.setIsUserLoggedIn();
        dismissProgressDialog();
        GetContext.to(DashboardScreen());
      },
    );
    // }
  }

  void getUserId(String token) {
    List<String> parts = token.split('.');
    String decodedPayload = utf8.decode(base64Url.decode(parts[1]));
    //String decodedPayload = utf8.decode(base64Url.decode(parts[1].padRight((parts[1].length + 4) ~/ 4 * 4, '=')));
    Map<String, dynamic> payloadMap = json.decode(decodedPayload);
    Map<String, dynamic> userData = payloadMap["data"]["user"];
    String? userId = userData["id"];
    debugPrint("userID : $userId");
    _appPreferences.setUserId(userId ?? "");
  }

  void getRegister() async {
    showProgressDialog();
    final response = await authRepositoryImpl.getRegister({
      "email": emailController.text,
      "password": passController.text,
      "username": nameController.text
    });

    response.fold((l) {
      dismissProgressDialog();
      showCustomSnackBar(
          context: GetContext.context,
          message: l.message.toString(),
          isError: true);
    }, (r) async {
      dismissProgressDialog();
      await showCustomSnackBar(
              context: GetContext.context, message: "Registration Successful")
          .then((value) => GetContext.offAll(Routes.login));

    });
  }
}
