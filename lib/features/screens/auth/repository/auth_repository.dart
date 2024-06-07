import 'package:dokan/data/network/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ApiFailure, dynamic>> getLogin(Map<String,dynamic> params);
  Future<Either<ApiFailure, dynamic>> getRegister(Map<String,dynamic> params);
}
