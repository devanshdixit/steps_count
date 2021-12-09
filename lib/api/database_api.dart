import 'dart:convert';

import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/exceptions/firestore_api_exception.dart';
import 'package:steps_count/models/application_models.dart';
import 'package:http/http.dart' as https;
import 'package:steps_count/ui/shared/constants.dart';

class DatabaseApi {
  final log = getLogger('DatabaseApi');

  Future<void> createUser({required Users user}) async {
    log.i('user:$user');

    try {
      final res = await https
          .post(Uri.parse('${Assets.databaseApiLink}/createuser'), body: {
        'id': user.id,
        'name': user.name,
        'emailId': user.email,
        'photourl': user.photourl,
      });
      final body = json.decode(res.body);
      log.v('UserCreated at ${body['id']}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<Users?> getUser({required String userId}) async {
    if (userId.isNotEmpty) {
      final res = await https
          .get(Uri.parse('${Assets.databaseApiLink}/user/${userId}'));
      Map<String, dynamic> body = json.decode(res.body);
      return Users.fromJson(body);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }

  Future<void> updateSteps({required Users user, required Object steps}) async {
    try {
      final res = await https.put(
        Uri.parse('${Assets.databaseApiLink}/steps/${user.id}'),
        body: steps,
      );
      final body = json.decode(res.body);
      log.v('steps updated at $body');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }
}
