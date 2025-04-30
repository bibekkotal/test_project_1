import '../screens/authentication/authentication_screen.dart';
import '../screens/authentication/authentication_screen_binding.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/home_screen_binding.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/splash/splash_screen_binding.dart';
import '../utils/app_exports.dart';

class AppRoutes {
  AppRoutes._();

  static AppRoutes instance = AppRoutes._();

  static const Duration transitionDuration = Duration(milliseconds: 100);

  List<GetPage> routes() {
    return [
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
      GetPage(
        name: RouteNames.authentication,
        page: () => const AuthenticationScreen(),
        binding: AuthenticationScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
      GetPage(
        name: RouteNames.home,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
    ];
  }
}
