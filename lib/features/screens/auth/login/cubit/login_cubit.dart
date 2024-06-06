// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../../core/app/app_dependency.dart';
// import '../../../../core/app/app_preference.dart';
//
// part 'login_state.dart';
//
// @injectable
// class LoginCubit extends Cubit<LoginState> {
//   final AppPreferences _appPreferences;
//
//   LoginCubit(this._loginRepository)
//       : _appPreferences = instance.get(),
//         super(LoginState());
//
//   Future<void> login(dynamic userInfo) async {
//     emit(state.copyWith(status: LoginStatus.loading));
//     response.fold(
//       (failure) {
//         emit(state.copyWith(status: LoginStatus.failure));
//       },
//       (data) async {
//         emit(state.copyWith(status: LoginStatus.success));
//       },
//     );
//   }
// }
