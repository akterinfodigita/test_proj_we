import 'package:dartz/dartz.dart';
import 'package:dokan/data/network/api_failure.dart';
import 'package:dokan/features/screens/auth/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/network/api_client.dart';
import '../../../../data/network/api_exception.dart';
import '../../../../data/network/api_urls.dart';
import '../models/login_response.dart';

@injectable
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl(this.apiClient);

  @override
  Future<Either<ApiFailure, LoginResponse>> getLogin(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.loginUrl, method: Method.post, params: params);
      return Right(LoginResponse.fromJson(response));
    } catch (error, stackTrace) {
      return Left(ApiException.handle(stackTrace).failure);
    }
  }

  @override
  Future<Either<ApiFailure, dynamic>> getRegister(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.registrationUrl, method: Method.post, params: params);
      return Right(response);
    } catch (error, stackTrace) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
