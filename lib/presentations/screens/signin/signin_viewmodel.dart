import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:user/core/enums/otp.dart';
import 'package:user/inject_dependencies.dart';
import 'package:user/models/user.dart';
import 'package:user/parameters/signin_otp_params.dart';
import 'package:user/presentations/helpers/gotos.dart';
import 'package:user/presentations/helpers/popup.dart';
import 'package:user/usecases/common/save_local_token.dart';
import 'package:user/usecases/otp/signin_otp.dart';
import 'package:user/usecases/profile/save_local_profile.dart';

class SignInViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormBuilderState>();
  final mobileNumber = TextEditingController();
  bool canSubmit = false;

  Future<void> init() async {
    mobileNumber.text = '';
    notifyListeners();
  }

  void formChanged() {
    if (formKey.currentState?.isValid ?? false) {
      canSubmit = true;
    } else {
      canSubmit = false;
    }

    notifyListeners();
  }

  Future buttonNext() async {
    debugPrint('>>>--------->>> NEXT:');
    
    if (formKey.currentState?.isValid ?? false) {
      final String mobile = '+63${mobileNumber.text}';

      PopUpHelper.loading(message: 'Requesting OTP');
      final signInOTP = locator<SignInOTPUseCase>();
      final tokenEither = await signInOTP(SignInOTPParams(mobile: mobile));
      String? accessToken;

      await tokenEither.fold(
        (failure) async {
          accessToken = null;
          PopUpHelper.error(message: failure.message);
        }, 
        (data) async {
          accessToken = data.token;
          PopUpHelper.close();

          Gotos.otp(
            type: OTP.signIn,
            requestId: accessToken!,
            mobile: mobile,
            onBack: () async { await Gotos.main(pageIndex: 0); },
            onSignIn: (token, user) async {
              final userModel = user as User;
              final String userString = jsonEncode(userModel.toJson());

              final saveLocalToken = locator<SaveLocalTokenUseCase>();
              await saveLocalToken(accessToken!);

              final saveLocalProfile = locator<SaveLocalProfileUseCase>();
              await saveLocalProfile(userString);

              await Gotos.main(pageIndex: 0);
            },
            onSignUp: (token, _) async {},
          );
        }
      );
    }
  }
}
