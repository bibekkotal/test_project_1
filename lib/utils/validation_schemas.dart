import 'package:form_validator/form_validator.dart';

import 'app_strings.dart';

// REGEX
RegExp strongPassword = RegExp(
  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[=.!@/$#\$&*~%^()_+-]).{8,}$',
);
RegExp strongUserName = RegExp(
  r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$',
);
RegExp validAddress = RegExp(r'^\d+(?:\.\d+)?$');

final Map<String, ValidationBuilder> authenticationValidationSchema = {
  // 'mobile': ValidationBuilder(
  //       optional: false,
  //       requiredMessage: StaticStrings.phoneRequiredStrongMsg,
  //     )
  //     .minLength(9, StaticStrings.phoneMaxLengthMsg)
  //     .maxLength(11, StaticStrings.phoneMaxLengthMsg)
  //     .phone(StaticStrings.phoneValidMsg),
  'username': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.usernameRequiredMsg,
      )
      .minLength(3, StaticStrings.usernameTooShortMsg)
      .maxLength(20, StaticStrings.usernameTooLongMsg),

  'email': ValidationBuilder(
    optional: false,
    requiredMessage: StaticStrings.emailRequiredMsg,
  ).email(StaticStrings.emailInvalidMsg),

  'password': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.passwordRequiredMsg,
      )
      .minLength(6, StaticStrings.passwordTooShortMsg)
      .regExp(
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$'),
        StaticStrings.passwordWeakMsg,
      ),

  'confirmPassword': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.confirmPasswordRequiredMsg,
      )
      .minLength(6, StaticStrings.confirmPasswordTooShortMsg)
      .regExp(
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$'),
        StaticStrings.confirmPasswordWeakMsg,
      ),
};
