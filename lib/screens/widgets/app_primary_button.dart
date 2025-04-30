import 'package:get/get.dart';

import '../../utils/app_exports.dart';

class Buttons {
  DateTime? loginClickTime;

  static Widget primaryBtn({
    required BuildContext context,
    required String title,
    required Function event,
    bool? isLoadingProgress = false,
    double btnTitleFontSize = 20.0,
    bool enable = true,
    Color? foregroundColor,
    Color? backgroundColor,
    double paddingVertical = 50,
    double paddingHorizontal = 10,
    double borderRadius = 15,
  }) {
    return SizedBox(
      width: isLoadingProgress == true ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ?? Colors.white,
          backgroundColor: backgroundColor ?? Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isLoadingProgress == true ? 100.r : borderRadius.r,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height / paddingVertical,
            horizontal:
                MediaQuery.sizeOf(context).width /
                (isLoadingProgress == true
                    ? paddingHorizontal - 30.w
                    : paddingHorizontal),
          ),
          elevation: 5,
        ),
        onPressed:
            !enable
                ? null
                : () async {
                  if (!isLoadingProgress!) {
                    await event();
                  }
                },
        child:
            isLoadingProgress == true
                ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: btnTitleFontSize.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: CustomFonts.Poppins,
                    ),
                  ),
                ),
      ),
    );
  }

  static Widget socialIconButton({
    required String assetPath,
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        splashColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Container(
          width: 75.w,
          height: 43.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive ? Colors.green : Colors.grey.shade400,
              width: 1.2,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(assetPath, width: 22.w, height: 22.h),
          ),
        ),
      ),
    );
  }

  static Widget customButton({
    required BuildContext context,
    required String title,
    required Function event,
    bool isLoadingProgress = false,
    double btnTitleFontSize = 17.0,
    bool enable = true,
    double borderRadius = 30,
    double height = 60,
    double width = double.infinity,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: enable && !isLoadingProgress ? () async => await event() : null,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.white.withOpacity(0.2),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              center: Alignment(0.0, -2),
              radius: 4,
              colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child:
                isLoadingProgress
                    ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        strokeCap: StrokeCap.round,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                    : Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: btnTitleFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: CustomFonts.Poppins,
                      ),
                    ),
          ),
        ),
      ),
    );
  }

  static Widget flatBtn({
    required BuildContext context,
    required String title,
    required Function event,
    bool? isLoadingProgress = false,
    double btnTitleFontSize = 20.0,
    bool enable = true,
    Color? foregroundColor,
    Color? backgroundColor,
    double paddingVertical = 50,
    double paddingHorizontal = 10,
    double borderRadius = 15,
    Widget? suffixIcon,
    Color? btnTitleColor,
  }) {
    return SizedBox(
      width: isLoadingProgress == true ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.white,
          backgroundColor: backgroundColor ?? AppColors.backGround,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isLoadingProgress == true ? 100.r : borderRadius.r,
            ),
            side: BorderSide(width: 1, color: AppColors.grey.withOpacity(0.5)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height / paddingVertical,
            horizontal:
                MediaQuery.sizeOf(context).width /
                (isLoadingProgress == true
                    ? paddingHorizontal - 30.w
                    : paddingHorizontal),
          ),
        ),
        onPressed:
            !enable
                ? null
                : () async {
                  if (!isLoadingProgress!) {
                    await event();
                  }
                },
        child:
            isLoadingProgress == true
                ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: const CircularProgressIndicator(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black12),
                  ),
                )
                : SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      suffixIcon ?? const SizedBox.shrink(),
                      FittedBox(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: btnTitleFontSize.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: CustomFonts.Poppins,
                            color: btnTitleColor ?? AppColors.black,
                          ),
                        ),
                      ).paddingOnly(left: 5.w),
                    ],
                  ),
                ),
      ),
    );
  }

  static Widget whiteBtn({
    required BuildContext context,
    required String title,
    required Function event,
    bool? isLoadingProgress = false,
    double btnTitleFontSize = 20.0,
    bool enable = true,
    Color? foregroundColor,
    Color? backgroundColor,
    double paddingVertical = 50,
    double paddingHorizontal = 10,
    double borderRadius = 15,
    double? elevation = 2,
    Color? btnTitleColor,
  }) {
    return SizedBox(
      width: isLoadingProgress == true ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.pressed)) {
              return (backgroundColor ?? AppColors.indicatorColor).withOpacity(
                0.8,
              );
            }
            return backgroundColor ?? AppColors.indicatorColor;
          }),
          foregroundColor: MaterialStateProperty.all(
            foregroundColor ?? AppColors.white,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.3); // Ripple effect color
            }
            return Colors.transparent;
          }),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                isLoadingProgress == true ? 100.r : borderRadius.r,
              ),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height / paddingVertical,
              horizontal:
                  MediaQuery.sizeOf(context).width /
                  (isLoadingProgress == true
                      ? paddingHorizontal - 30.w
                      : paddingHorizontal),
            ),
          ),
        ),
        onPressed:
            !enable
                ? null
                : () async {
                  if (!isLoadingProgress!) {
                    await event();
                  }
                },
        child:
            isLoadingProgress == true
                ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: const CircularProgressIndicator(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: btnTitleColor ?? Colors.white,
                      fontSize: btnTitleFontSize.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: CustomFonts.Poppins,
                    ),
                  ),
                ),
      ),
    );
  }
}
