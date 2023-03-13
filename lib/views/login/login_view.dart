import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_sample_application/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_sample_application/views/constants/app_colors.dart';
import 'package:instagram_sample_application/views/constants/strings.dart';
import 'package:instagram_sample_application/views/login/divider_with_margins.dart';
import 'package:instagram_sample_application/views/login/facebook_button.dart';
import 'package:instagram_sample_application/views/login/google_button.dart';
import 'package:instagram_sample_application/views/login/login_view_signup_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 14),
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const DividerWithMargins(),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(height: 1.5),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed:
                    ref.read(authStateProvider.notifier).loginWithFacebook,
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor),
                child: const FacebookButton(),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor),
                child: const GoogleButton(),
              ),
              const DividerWithMargins(),
              const LoginViewSignupLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
