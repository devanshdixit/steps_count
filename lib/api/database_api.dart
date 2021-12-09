import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/exceptions/firestore_api_exception.dart';
import 'package:steps_count/models/application_models.dart';

class DatabaseApi {
  final log = getLogger('DatabaseApi');

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {} catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    if (userId.isNotEmpty) {
      // final userDoc = await usersCollection.doc(userId).get();
      // if (!userDoc.exists) {
      //   log.v('We have no user with id $userId in our database');
      //   return null;
      // }
      // Object? data = userDoc.data();
      // String s = json.encode(data!);
      // Map<String, dynamic> user = jsonDecode(s);
      // return User.fromJson(user);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }
}
