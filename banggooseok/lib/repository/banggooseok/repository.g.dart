// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BanggooseokRepository implements BanggooseokRepository {
  _BanggooseokRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.64.218.185:8080/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<RoomList> getRoomList({page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/room/list/$page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RoomList.fromJson(_result.data);
    return value;
  }

  @override
  Future<Room> getRoom({roomId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/room/$roomId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Room.fromJson(_result.data);
    return value;
  }

  @override
  Future<SubmitResponse> postRoom({presExId, userId, room}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pres_ex_id': presExId,
      r'user_id': userId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(room?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/api/room/submit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SubmitResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<RoomImage> postImage({roomId, presExId, userId, image}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pres_ex_id': presExId,
      r'user_id': userId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (image != null) {
      _data.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(image.path,
              filename: image.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/image/$roomId/submit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RoomImage.fromJson(_result.data);
    return value;
  }

  @override
  Future<AgentResponse> issuerAgent({token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'token': token};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/did/issuer/agent',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AgentResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> issuerInvitation({token, alias}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'token': token, r'alias': alias};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>('/api/did/issuer/invitation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<V20Response> issuerCredential({token, alias}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'token': token, r'alias': alias};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/did/issuer/credential',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = V20Response.fromJson(_result.data);
    return value;
  }

  @override
  Future<V20Response> verifierKnock({alias}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'alias': alias};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/did/verifier/knock',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = V20Response.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifiedResponse> verifierVerified({presExId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'pres_ex_id': presExId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/did/verifier/verified',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifiedResponse.fromJson(_result.data);
    return value;
  }
}
