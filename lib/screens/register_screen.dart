import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_eat_restaurant/screens/widgets/text_button_with_info_widget.dart';
import 'package:easy_eat_restaurant/utlis/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../core/app_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/constatns.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormBuilderState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    CountryCode? countryCode;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthVerifiState) {
          GoRouter.of(context).push(AppRouter.verification, extra: email);
        } else if (state is AuthAccountExistState) {
          context.showsnackbar(
              title: AppLocalizations.of(context).accountExist,
              color: Colors.green.shade200);
          GoRouter.of(context).go(AppRouter.login);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHight * 0.1),
                Text(
                  AppLocalizations.of(context).createAccount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHight * 0.02),
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        textCapitalization: TextCapitalization.words,
                        name: AuthK.nameString,
                        decoration: customInputDecoration(
                            hintString: AppLocalizations.of(context).name),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      FormBuilderTextField(
                        name: AuthK.emailString,
                        decoration: customInputDecoration(
                            hintString: AppLocalizations.of(context).email),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      FormBuilderTextField(
                        name: AuthK.passwordString,
                        decoration: customInputDecoration(
                            hintString: AppLocalizations.of(context).password),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      FormBuilderTextField(
                        name: AuthK.confirmPasswordString,
                        decoration: customInputDecoration(
                            hintString:
                                AppLocalizations.of(context).confirmPassword),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                          (val) {
                            // ignore: unrelated_type_equality_checks
                            if (formKey.currentState!
                                    .fields[AuthK.passwordString]!.value !=
                                val) {
                              return AppLocalizations.of(context)
                                  .passwordsDontMach;
                            }
                            return null;
                          }
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                      ),
                      SizedBox(height: screenHight * 0.02),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              onChanged: (value) => countryCode = value,
                              onInit: (value) => countryCode = value,
                              showDropDownButton: true,
                              initialSelection: 'PL',
                              favorite: const ['EN', 'PL'],
                              dialogBackgroundColor:
                                  Theme.of(context).colorScheme.background,
                              barrierColor:
                                  Theme.of(context).colorScheme.background,
                              textStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FormBuilderTextField(
                              name: AuthK.phoneNumberString,
                              decoration: customInputDecoration(
                                  hintString:
                                      AppLocalizations.of(context).phone),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                                FormBuilderValidators.minLength(5),
                                FormBuilderValidators.maxLength(13),
                              ]),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHight * 0.02),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            email = formKey
                                .currentState!.fields[AuthK.emailString]!.value;
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              EmailSignUpAuthEvent(
                                name: formKey.currentState!
                                    .fields[AuthK.nameString]!.value,
                                countryCode: '$countryCode',
                                phone: formKey.currentState!
                                    .fields[AuthK.phoneNumberString]!.value,
                                email: formKey.currentState!
                                    .fields[AuthK.emailString]!.value,
                                password: formKey.currentState!
                                    .fields[AuthK.passwordString]!.value,
                              ),
                            );
                          }
                        },
                        child: Text(AppLocalizations.of(context).createAccount),
                      ),
                      SizedBox(height: screenHight * 0.005),
                      TextButtonWithInfo(
                          infoString: AppLocalizations.of(context).haveAccount,
                          textButtonCallback: () {
                            GoRouter.of(context).go(AppRouter.login);
                          },
                          textButtonChild: AppLocalizations.of(context).login),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
