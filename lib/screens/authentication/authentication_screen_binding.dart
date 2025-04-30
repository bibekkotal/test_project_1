import 'package:get/get.dart';
import '../../repositories/authentication_repositories.dart';
import '../../services/authentication_services.dart';
import 'authentication_controller.dart';

class AuthenticationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationServices());
  }
}
