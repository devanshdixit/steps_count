import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/models/application_models.dart';
import 'package:steps_count/api/database_api.dart';

class UserService {
  final log = getLogger('UserService');
  final _databaseApi = locator<DatabaseApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _databaseApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    } else {
      _currentUser = null;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user:${user.id}');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user ...');
      await _databaseApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  Future<void> get logout async =>
      await _firebaseAuthenticationService.logout().then((value) {
        _currentUser = null;
      });
}
