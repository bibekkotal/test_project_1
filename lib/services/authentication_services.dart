import '../repositories/authentication_repositories.dart';
import '../utils/app_exports.dart';
import 'package:dio/dio.dart' as dio_client;
import 'base.dart';

class AuthenticationServices extends AuthenticationRepository {
  @override
  Future<ApiResult> registration(
    String username,
    String email,
    String password,
    String confirmPassword,
  ) async {
    dio_client.FormData dataPayload = dio_client.FormData.fromMap({
      'username': username,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    });
    return await ApiRequest().request(
      headers: {"Content-Type": 'multipart/form-data'},
      body: dataPayload,
      method: ApiMethods.post,
      endpoint: API.register,
    );
  }
}
