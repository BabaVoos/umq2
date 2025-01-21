import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umq/lib/core/helpers/extensions.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/show_loading.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/gradient_title.dart';
import '../widgets/primary_button.dart';
import '../widgets/seconday_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showLoading(context);
        }
        if (state is LoginSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.navScreen,
              predicate: (_) => false);
        }
        if (state is AuthFailed) {
          Navigator.pop(context);
          showErrorDialog(
            context,
            content: state.message,
            title: 'Login Failed',
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: context.screenSize.height * 0.2,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    ImagesManager.splashWave,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const GradientTitle(),
              verticalSpacing(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Do you have an account?',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppPalette.textLightBlue),
                      ),
                      verticalSpacing(20),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Email is required';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Email',
                        hintText: "Type your email or phone number",
                        controller: emailController,
                      ),
                      verticalSpacing(20),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password is required';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'password',
                        hintText: 'Type your password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot your password ?',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      verticalSpacing(30),
                      PrimaryButton(
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                      ),
                      verticalSpacing(20),
                      SecondayButton(
                        title: 'Register',
                        onPressed: () {
                          context.pushNamed(Routes.signUpScreen);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
