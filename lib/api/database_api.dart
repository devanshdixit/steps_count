import 'dart:convert';

import 'package:steps_count/app/app.logger.dart';
import 'package:steps_count/exceptions/firestore_api_exception.dart';
import 'package:steps_count/models/application_models.dart';
import 'package:http/http.dart' as https;
import 'package:steps_count/ui/shared/constants.dart';

class DatabaseApi {
  final log = getLogger('DatabaseApi');

  Future createUser({
    required String name,
    required String telegramId,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final res = await https
          .post(Uri.parse('${Assets.databaseApiLink}/register'), body: {
        'name': name,
        'telegram_id': telegramId,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
      });
      final body = json.decode(res.body);
      log.v('UserCreated at $body');
      return body;
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future loginUser({required String email, required String password}) async {
    try {
      final res =
          await https.post(Uri.parse('${Assets.databaseApiLink}/login'), body: {
        'email': email,
        'password': password,
      });
      final body = json.decode(res.body);
      log.v('Login success $body');
      return body;
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to login',
        devDetails: '$error',
      );
    }
  }

  Future<Users?> getUser({required String? userEmail}) async {
    if (userEmail != null) {
      try {
        final res = await https.post(
          Uri.parse('${Assets.databaseApiLink}/usersemail'),
          body: {
            "email": userEmail.toString(),
          },
        );
        if (res.statusCode == 200) {
          Map<String, dynamic> body = json.decode(res.body);
          final data = {
            'id': body['data']['id'].toString(),
            'email': body['data']['email'],
            'userName': body['data']['name'],
            'photourl': body['data']['profile_pic'] ??
                'https://img.icons8.com/color/48/000000/gender-neutral-user.png',
            'telegramId': body['data']['telegram_id'],
            'createdAt': body['data']['created_at'],
            'emailVerified': body['data']['email_verified_at'],
            'updatedAt': body['data']['updated_at'],
          };
          return Users.fromJson(data);
        } else {
          return null;
        }
      } catch (e) {
        throw FirestoreApiException(message: e.toString());
      }
    } else {
      throw FirestoreApiException(
        message:
            'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.',
      );
    }
  }

  Future<void> updateSteps({required Users user, required Object steps}) async {
    try {
      final res = await https.post(
        Uri.parse(
            '${Assets.databaseApiLink}/steps?user_id=${user.id}&steps=$steps'),
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
