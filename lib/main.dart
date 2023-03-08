import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_sample_application/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_sample_application/views/components/loading/loading_screen.dart';
import 'firebase_options.dart';
import 'package:instagram_sample_application/state/auth/providers/is_logged_in_provider.dart';
import 'package:instagram_sample_application/state/providers/is_loading_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen<bool>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(context: context);
              } else {
                LoadingScreen.instance().hide();
              }
            },
          );
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
      ),
      body: Consumer(
        builder: (_, ref, child) {
          return TextButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text('Logout'),
          );
        },
      ),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login View'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
            child: const Text('Sign in with google'),
          ),
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithFacebook,
            child: const Text('Sign in with Facebook'),
          ),
        ],
      ),
    );
  }
}
