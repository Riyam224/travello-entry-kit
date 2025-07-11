import 'package:get_it/get_it.dart';
import 'package:travello/core/services/firebase_auth_service.dart';
import 'package:travello/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travello/features/auth/domain/rspos/auth_repo.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
}
