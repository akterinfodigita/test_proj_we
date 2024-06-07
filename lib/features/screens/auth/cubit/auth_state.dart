part of 'auth_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

class AuthState extends Equatable {
  final LoginStatus status;
  const AuthState({
    this.status = LoginStatus.initial,
  });

  AuthState copyWith({
    final LoginStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
