// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ContentsRepository implements ContentsRepository {
  _ContentsRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.64.218.185:8080/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<RoomSimple>> getRoomData({page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        '/bbanggooseok-core/api/room/list/$page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => RoomSimple.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
