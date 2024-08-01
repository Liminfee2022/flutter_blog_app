import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_filed.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: AppPallete.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign Up.',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                AuthFiled(
                  controller: nameController,
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthFiled(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthFiled(
                  controller: passwordController,
                  hintText: 'Password',
                  isObsecureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthGradientButton(
                  title: 'Sign Up',
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignInPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: ' Sign In',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
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
