import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../core/constatns.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBuilder(
              key: formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Column(
                  children: [
                    const Text(
                      K.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Image.asset(
                      "assets/source.gif",
                      width: 200,
                    ),
                    FormBuilderTextField(
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                      textCapitalization: TextCapitalization.none,
                      name: AuthK.emailString,
                      decoration: customInputDecoration(
                          hintString: AppLocalizations.of(context).email),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: AuthK.passwordString,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).password,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Ui.borderRadius20))),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return const CircularProgressIndicator(
                            color: Colors.green,
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(EmailSignInAuthEvent(
                                  formKey.currentState!
                                      .fields[AuthK.emailString]!.value,
                                  formKey.currentState!
                                      .fields[AuthK.passwordString]!.value,
                                ));
                              }
                            },
                            child: Text(AppLocalizations.of(context).login),
                          );
                        }
                      },
                    ),
                    TextButtonWithInfo(
                        infoString: AppLocalizations.of(context).noAccount,
                        textButtonCallback: () {
                          GoRouter.of(context).go(AppRoute.registerscreen);
                        },
                        textButtonChild:
                            AppLocalizations.of(context).createAccount),
                    TextButtonWithInfo(
                      infoString: AppLocalizations.of(context).forgotPassword,
                      textButtonCallback: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(const SignOutEvent());
                      },
                      textButtonChild:
                          AppLocalizations.of(context).remindPassowrd,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
