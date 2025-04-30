import 'dart:convert';

import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(const Duration(milliseconds: 100), () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black45,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    controller.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    Object? registrationResponse = ModalRoute.of(context)!.settings.arguments;
    String prettyJson = const JsonEncoder.withIndent(
      '  ',
    ).convert(registrationResponse);

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.textColor),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
            fontFamily: CustomFonts.Poppins,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Text(
                  prettyJson,
                  style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGreen,
                    fontFamily: CustomFonts.Poppins,
                  ),
                  textAlign: TextAlign.left,
                ).paddingOnly(left: 50.w, right: 50, top: 100.h, bottom: 16.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
}
