import 'package:get_it/get_it.dart';
import 'package:travello/core/services/database_service.dart';
import 'package:travello/core/services/firebase_auth_service.dart';
import 'package:travello/core/services/firestore_service.dart';
import 'package:travello/features/auth/data/repos/auth_repo_impl.dart';

import 'package:travello/features/auth/domain/rspos/auth_repo.dart';

GetIt getIt = GetIt.instance;

void setup() {
  /// I use signalReady here only to show how to use it. In 99% of the cases
  /// you don't need it. Just use registerSingletonAsync
  ///
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
