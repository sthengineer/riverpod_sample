import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_sample_application/state/auth/models/auth_state.dart';
import 'package:instagram_sample_application/state/auth/notifier/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (_) => AuthStateNotifier());
