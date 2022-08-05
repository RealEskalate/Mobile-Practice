import 'package:dio/dio.dart';
import 'secure_storage.dart';
import 'package:flutter/material.dart';

Dio createDio() {
  final dio = Dio();

  dio.options.baseUrl = "https://blog-app-backend.onrender.com/api";
  dio.interceptors.addAll([
    AuthInterceptor(dio), // add this line before LogInterceptor
    LogInterceptor(),
  ]);
  return dio;
}

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final _localStorage = SecureStorage();

  AuthInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["requiresToken"] == false) {
      // if the request doesn't need token, then just continue to the next interceptor
      options.headers.remove("requiresToken"); //remove the auxiliary header
      return handler.next(options);
    }

    // get tokens from local storage, you can use Hive or flutter_secure_storage
    final accessToken = await _localStorage.getToken();

    if (accessToken == null || accessToken == "") {
      _performLogout(_dio);
    }

    // add access token to the request header
    options.headers["Authorization"] = "Bearer $accessToken";
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // for some reasons the token can be invalidated before it is expired by the backend.
      // then we should navigate the user back to login page

      _performLogout(_dio);
    }
    return handler.next(err);
  }

  void _performLogout(Dio dio) {
    _localStorage.deleteToken(); // remove token from local storage
    // call the log out function here
    // navigatorKey.currentState?.pushReplacementNamed(LoginPage.routeName);
    // Navigator.pushNamed(context, "/signup");
  }

  /// return true if it is successfully regenerate the access token
}
