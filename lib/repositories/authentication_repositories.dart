import '../utils/api_requests.dart';

abstract class AuthenticationRepository {
  Future<ApiResult> registration(
    String username,
    String email,
    String password,
    String confirmPassword,
  );
}
