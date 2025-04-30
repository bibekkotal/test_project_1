import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';
import '../../utils/validation_schemas.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/app_textfield.dart';
import 'authentication_controller.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final controller = Get.find<AuthenticationController>();

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.dimWhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Formik(
          enableReinitialize: false,
          validateOnChange: true,
          initialValues: {
            'username': '',
            'email': '',
            'password': '',
            'confirmPassword': '',
          },
          validationSchema: authenticationValidationSchema,
          onSubmit: (payload, errors) {
            if (errors.isEmpty) {
              controller.submitAuthentication(
                username: payload['username'],
                email: payload['email'],
                password: payload['password'],
                confirmPassword: payload['confirmPassword'],
              );
            }
          },
          child: (
            Map<String, dynamic> values,
            bool? isValid,
            Function handleSubmit,
            Function handleReset,
            Function handleChange,
            Map<String, String> errors,
          ) {
            return Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StaticStrings.welcome,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                          fontFamily: CustomFonts.Poppins,
                        ),
                      ).paddingSymmetric(horizontal: 30.w),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          StaticStrings.authenticationTitle,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                            fontFamily: CustomFonts.Poppins,
                          ),
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 30.w),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          StaticStrings.authenticationSubTitle,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                            fontFamily: CustomFonts.Poppins,
                          ),
                          textAlign: TextAlign.left,
                        ).paddingOnly(left: 30.w, top: 16.h, bottom: 16.h),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Divider(
                        color: AppColors.darkGreen,
                        indent: 30.w,
                        endIndent: mediaWidth / 1.4,
                        thickness: 3.1,
                      ),
                    ).marginOnly(bottom: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 17.h,
                        horizontal: 25.w,
                      ),
                      child: CustomInput.appTextField(
                        prefixIcon: SvgPicture.asset(AppImages.userNameIcon),
                        label: '',
                        hint: StaticStrings.userName,
                        onChange: (value) => handleChange('username', value),
                        errorMessage: errors['username'],
                        textInputAction: TextInputAction.next,
                        maxLength: 70,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 25.w,
                      ),
                      child: CustomInput.appTextField(
                        prefixIcon: SvgPicture.asset(AppImages.emailIcon),
                        label: '',
                        hint: StaticStrings.emailId,
                        onChange: (value) => handleChange('email', value),
                        errorMessage: errors['email'],
                        textInputAction: TextInputAction.next,
                        maxLength: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 25.w,
                      ),
                      child: CustomInput.appTextField(
                        prefixIcon: SvgPicture.asset(AppImages.passwordIcon),
                        label: '',
                        hint: StaticStrings.yourPassword,
                        onChange: (value) => handleChange('password', value),
                        errorMessage: errors['password'],
                        textInputAction: TextInputAction.next,
                        maxLength: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 25.w,
                      ).copyWith(bottom: 40.h),
                      child: CustomInput.appTextField(
                        prefixIcon: SvgPicture.asset(AppImages.passwordIcon),
                        label: '',
                        hint: StaticStrings.confirmPassword,
                        onChange:
                            (value) => handleChange('confirmPassword', value),
                        errorMessage: errors['confirmPassword'],
                        textInputAction: TextInputAction.done,
                        maxLength: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Obx(
                        () => Buttons.customButton(
                          isLoadingProgress: controller.isLoading.value,
                          context: context,
                          title: StaticStrings.signup,
                          event: () => handleSubmit(),
                        ),
                      ),
                    ),
                    _loginOrSection(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons.socialIconButton(
                          assetPath: AppImages.googleIcon,
                          onPressed: () {},
                          isActive: true,
                        ),
                        SizedBox(width: 10),
                        Buttons.socialIconButton(
                          assetPath: AppImages.appleIcon,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ).marginOnly(top: mediaHeight / 2.3, bottom: 60),
                Image.asset(
                  AppImages.loginTopBg,
                  width: mediaWidth,
                  height: mediaHeight / 2,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  AppImages.logo,
                  width: mediaWidth,
                  height: mediaHeight / 4.8,
                  fit: BoxFit.contain,
                ).marginOnly(
                  left: mediaWidth / 15,
                  right: mediaWidth / 15,
                  top: mediaHeight / 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loginOrSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 30.h),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: AppColors.textColor)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              StaticStrings.orSignUpWith,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
          Expanded(child: Divider(thickness: 1, color: AppColors.textColor)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AuthenticationController>();
    super.dispose();
  }
}
