import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_project/utils/app_colors.dart';
import 'package:test_project/utils/global_binding.dart';
import 'navigation/app_routes.dart';
import 'navigation/route_names.dart';

void main() {
  RenderErrorBox.backgroundColor = Colors.black26;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.white);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Hayat());
}

class Hayat extends StatelessWidget {
  const Hayat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(428, 926),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder:
          (BuildContext context, Widget? widget) => GetMaterialApp(
            initialBinding: GlobalBindings(),
            debugShowCheckedModeBanner: false,
            title: 'Hayat',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: false,
              typography: Typography.material2021(),
              splashFactory: InkRipple.splashFactory,
              splashColor: AppColors.grey.withOpacity(0.3),
            ),
            getPages: AppRoutes.instance.routes(),
            initialRoute: RouteNames.splash,
          ),
    );
  }
}
