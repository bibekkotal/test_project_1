import 'package:get/get.dart';
import '../../../../utils/app_exports.dart';
import '../../repositories/authentication_repositories.dart';
import '../../utils/colorful_log.dart';
import '../../utils/message_helper.dart';
import '../data/preference_controller.dart';

class AuthenticationController extends GetxController {
  RxBool isLoading = false.obs;
  final _repo = Get.find<AuthenticationRepository>();
  final _prefs = Get.find<PreferenceController>();
  late BuildContext pageContext;

  Future submitAuthentication({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (await NetworkCheckerUtils.hasNetwork()) {
      isLoading.value = true;
      ApiResult result = await _repo.registration(
        username,
        email,
        password,
        confirmPassword,
      );
      if (result.response?.status == 200 || result.response?.status == 201) {
        ColorLog.devLog(result.response!.data!);

        if (result.response!.data!['status'] == 'success') {
          if (!pageContext.mounted) return;
          MessageHelper.success(
            message: result.response!.data!['message'],
            context: pageContext,
          );
          isLoading.value = false;
          Get.toNamed(RouteNames.home, arguments: result.response!.data ?? {});
        } else if (result.response!.data!['status'] == 'error') {
          if (!pageContext.mounted) return;
          MessageHelper.error(
            message: result.response!.data!['message'].toString(),
            context: pageContext,
          );
          isLoading.value = false;
        }
      } else {
        if (!pageContext.mounted) return;
        MessageHelper.error(
          message: result.response!.data!['message'] ?? 'Something went wrong!',
          context: pageContext,
        );
        isLoading.value = false;
      }
    } else {
      MessageHelper.error(
        message: 'Internet connection error!',
        context: pageContext,
      );
    }
  }
}
