import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_sample_application/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_sample_application/state/posts/typdefs/user_id.dart';

final userIdProvider =
    Provider<UserId?>((ref) => ref.watch(authStateProvider).userId);
