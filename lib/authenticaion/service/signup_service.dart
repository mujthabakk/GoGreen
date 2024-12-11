import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:djangowithflutter/authenticaion/model/login_model/login_model.dart';
import 'package:djangowithflutter/authenticaion/model/signup_model/signup_model.dart';

class AuthService {
  Dio dio = Dio();

  Future<SignupModel?> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      log("hbunjkm");
      final Response response = await dio.post(
        'http://192.168.1.51:8000/login/register/',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      log("message1234");
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("message");
        log('Success Response: ${response.data}');
        return SignupModel.fromJson(response.data);
      } else {
        log('Unexpected Status Code: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error Response: ${e.response?.data}');
        log('Status Code: ${e.response?.statusCode}');
      } else {
        log('Error Message: ${e.message}');
        log('Request Details: ${e.requestOptions}');
      }
      return null;
    } catch (e) {
      log('Unexpected Error: $e');
      return null;
    }
  }

  Future<LoginModel?> login({
    required String username,
    required String password,
  }) async {
    try {
      final Response response = await dio.post(
        'http://192.168.1.51:8000/login/login/',
        data: {
          'email': username,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Success Response: ${response.data}');
        return LoginModel.fromJson(response.data);
      } else {
        log('Unexpected Status Code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Unexpected Error: $e');
      return null;
    }
  }
}
// 192.168.1.51
