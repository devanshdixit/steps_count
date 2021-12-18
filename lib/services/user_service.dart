import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:steps_count/app/app.locator.dart';
import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/api/database_api.dart';
import 'package:steps_count/models/application_models.dart';

class UserService {
  final log = getLogger('UserService');
  final _databaseApi = locator<DatabaseApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  Users? _currentUser;
  Users? get currentUser => _currentUser;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  void setUser(Users? user) {
    _currentUser = user;
  }

  Future<void> syncUserAccount() async {
    final firebaseUser =
        _firebaseAuthenticationService.firebaseAuth.currentUser;

    log.v('Sync user ${firebaseUser!.uid}');
    print(firebaseUser.email!);
    final userAccount =
        await _databaseApi.getUser(userEmail: firebaseUser.email!);
    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    } else {
      log.v('No user in database');
      _currentUser = null;
      // final res = await _databaseApi.createUser(
      //     user: Users(
      //   id: firebaseUser.uid,
      //   email: firebaseUser.email,
      //   userName: firebaseUser.displayName,
      //   photourl: firebaseUser.photoURL ??
      //       'https://img.icons8.com/color/48/000000/gender-neutral-user.png',
      // ));
      // if (res) {
      //   _currentUser = Users(
      //     id: firebaseUser.uid,
      //     email: firebaseUser.email,
      //     userName: firebaseUser.displayName,
      //     photourl: firebaseUser.photoURL ??
      //         'https://img.icons8.com/color/48/000000/gender-neutral-user.png',
      //   );
      // }
      log.v('_currentUser has been saved');
    }
  }

  Future<void> syncOrCreateUserAccount({required Users user}) async {
    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user ...');
      // await _databaseApi.createUser(
      //     user: Users(
      //   id: user.id,
      //   email: user.email,
      //   userName: user.userName ?? user.email,
      //   photourl: user.photourl ??
      //       'https://img.icons8.com/color/48/000000/gender-neutral-user.png',
      // ));
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  Future<void> get logout async =>
      await _firebaseAuthenticationService.logout().then((value) {
        _currentUser = null;
      });
}
