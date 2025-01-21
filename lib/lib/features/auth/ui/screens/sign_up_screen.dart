import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../bloc/auth_cubit.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/gradient_title.dart';
import '../widgets/primary_button.dart';
import '../widgets/seconday_button.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/show_loading.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isAgree = false;
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showLoading(context);
          } else if (state is AuthFailed) {
            context.pop();
            showErrorDialog(
              context,
              content: state.message,
              title: 'Register Failed',
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          } else if (state is RegisterSuccess) {
            context.pop();
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            context.pushReplacementNamed(Routes.loginScreen);
          }
        },
        child: SingleChildScrollView(
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
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Name',
                        hintText: "Type your name",
                        controller: nameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Name is required' : null,
                      ),
                      verticalSpacing(20),
                      CustomTextFormField(
                        labelText: 'Email',
                        hintText: "Type your email",
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,
                      ),
                      verticalSpacing(20),
                      CustomTextFormField(
                        labelText: 'Password',
                        hintText: "Type your password",
                        controller: passwordController,
                        validator: (value) =>
                            value!.isEmpty ? 'Password is required' : null,
                      ),
                      verticalSpacing(20),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: [
                            Radio(
                              fillColor: const WidgetStatePropertyAll(
                                  AppPalette.primaryLight),
                              value: true,
                              groupValue: isAgree,
                              onChanged: (_) {
                                setState(() {
                                  isAgree = !isAgree;
                                });
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I have agreed to the ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: AppPalette.textPrimaryLight,
                                            fontSize: 12),
                                  ),
                                  TextSpan(
                                    text: 'Terms and Condition',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: AppPalette.textPrimaryLight,
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacing(20),
                      PrimaryButton(
                        text: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                      ),
                      verticalSpacing(20),
                      SecondayButton(
                        title: "Login",
                        onPressed: () => context.pop(),
                      )
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
