import 'package:get/get.dart';
import '../../utils/app_exports.dart';

class CustomInput {
  static Widget appTextField({
    required String hint,
    required String label,
    TextEditingController? controller,
    TextInputType tp = TextInputType.text,
    int maxLength = 250,
    bool readOnly = false,
    int maxLine = 1,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? validationMsg,
    Function? validation,
    required Function? onChange,
    required String? errorMessage,
    String? initialValue,
    bool expands = false,
    double borderRadius = 50,
    TextAlignVertical textAlignVertical = TextAlignVertical.center,
    TextInputAction textInputAction = TextInputAction.none,
    ValueChanged<String>? onFieldSubmitted,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 1.0,
    Color? hintColor,
    FontWeight? fontWeight,
    Color focusedBorderColor = const Color(0xFFF0C808),
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.grey.shade200,
              width: borderWidth,
            ),
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5,
                spreadRadius: -2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  initialValue: initialValue,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[^\x00-\x7F]')),
                  ],
                  controller: controller,
                  maxLength: maxLength,
                  buildCounter: (
                    context, {
                    required currentLength,
                    required isFocused,
                    maxLength,
                  }) {
                    return const SizedBox();
                  },
                  maxLines: maxLine,
                  readOnly: readOnly,
                  expands: expands,
                  textInputAction: textInputAction,
                  onFieldSubmitted: onFieldSubmitted,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color:
                        readOnly == true
                            ? Colors.black.withOpacity(0.2)
                            : Colors.black,
                    fontFamily: CustomFonts.Poppins,
                  ),
                  decoration: InputDecoration(
                    // fillColor: Colors.transparent,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(
                      left: prefixIcon != null ? 70.w : 30.w,
                      top: 20.h,
                      bottom: 20.h,
                      right: suffixIcon != null ? 50.w : 30.w,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: hintColor ?? const Color(0xFF6F6E6E),
                      fontFamily: CustomFonts.Poppins,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(borderRadius.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFFF3A63E).withOpacity(0.1),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius.r - 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: focusedBorderColor,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius.r),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(borderRadius.r),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(borderRadius.r),
                    ),
                  ),
                  keyboardType: tp,
                  validator:
                      (value) => validation != null ? validation(value) : null,
                  onChanged:
                      (value) => onChange != null ? onChange(value) : null,
                ),
                if (prefixIcon != null)
                  Positioned(
                    left: 30.w,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: prefixIcon,
                    ),
                  ),
                if (suffixIcon != null)
                  Positioned(
                    right: 30.w,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: suffixIcon,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (errorMessage != null && errorMessage.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 16.w),
            child: Text(
              errorMessage.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.red,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
      ],
    );
  }
}
