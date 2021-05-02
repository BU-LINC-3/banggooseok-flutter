import 'dart:async';
import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk/src/common/api_factory.dart';
import 'package:banggooseok/repository/kakao_model.dart';

class UserApi {
  UserApi(this._dio);

  final Dio _dio;

  static final UserApi instance = UserApi(ApiFactory.authApi);

  Future<UserList> me() async {
    return ApiFactory.handleApiError(() async {
      Response response = await _dio
          .get("/v2/user/me", queryParameters: {"secure_resource": true});
      return UserList.fromJson(response.data);
    });
  }
}
