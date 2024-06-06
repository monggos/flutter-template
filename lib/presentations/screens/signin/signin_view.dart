import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';
import 'package:user/core/enums/button.dart';
import 'package:user/presentations/helpers/appbar.dart';
import 'package:user/presentations/helpers/assets.dart';
import 'package:user/presentations/helpers/buttons.dart';
import 'package:user/presentations/helpers/colors.dart';
import 'package:user/presentations/helpers/gotos.dart';
import 'package:user/presentations/helpers/typography.dart';
import 'package:user/presentations/screens/signin/signin_viewmodel.dart';
import 'package:user/presentations/widgets/loading_widget.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({super.key});
  
  @override
  void onDispose(SignInViewModel viewModel) { }

  @override
  SignInViewModel viewModelBuilder(BuildContext context) => SignInViewModel();

  @override
  void onViewModelReady(SignInViewModel viewModel) => SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.init());

  @override
  Widget builder(BuildContext context, SignInViewModel viewModel, Widget? child) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async => await Gotos.home(),
      child: Scaffold(
        backgroundColor: AppColorHelper.background,
        appBar: AppBarHelper.appBarNoTitleTextCancelButtonOnly(
          onCancel: () => Gotos.main(pageIndex: 0)
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: viewModel.isBusy == true ? const Loading() : SingleChildScrollView(
              primary: true,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Image.asset(AppUtils.imgLogo1024, width: 82, height: 82),
                  const SizedBox(height: 15),
                  const Text('Welcome!', style: AppTextHelper.headlineLarge,),
                  const Text('Login to Brgy. Labangon App', style: AppTextHelper.captionLarge),
                  const SizedBox(height: 60),
                  FormBuilder(
                    key: viewModel.formKey,
                    skipDisabled: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    onChanged: () => viewModel.formChanged(),
                    onPopInvoked: (pop) { },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('Enter your mobile number:', style: AppTextHelper.displayLarge),
                        const SizedBox(height: 7.5),
                        FormBuilderTextField(
                          name: 'mobile_number',
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          style: AppTextHelper.displayLarge,
                          controller: viewModel.mobileNumber,
                          decoration: const InputDecoration(
                            prefixText: '+63',
                            labelText: null,
                            hintText: null,
                            counterText: '',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(errorText: 'Please enter your mobile number.'),
                            FormBuilderValidators.equalLength(10, errorText: 'You entered invalid mobile number.'),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButtonHelper.flat(
                      text: 'Next',
                      enable: viewModel.canSubmit,
                      color: ButtonColor.blue,
                      size: ButtonSize.xl,
                      action: () => viewModel.buttonNext(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text: 'Create account?',
                  style: AppTextHelper.displayLarge.copyWith(
                    color: AppColorHelper.grey4,
                  ),
                  children: [
                    TextSpan(
                      text: ' Register',
                      style: AppTextHelper.displayLarge.copyWith(color: AppColorHelper.green, fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Gotos.signUp()
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          )
        ),
      ),
    );
  }
}
