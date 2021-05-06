// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AriesRepository implements AriesRepository {
  _AriesRepository(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.64.218.185:';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<String> holderReceiveInv(
      {port, alias, autoAccept = true, body}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'alias': alias,
      r'auto_accept': autoAccept
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = body;
    final _result = await _dio.request<String>(
        '$port/connections/receive-invitation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<RecordsResponse> holderRecords({port, threadId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'thread_id': threadId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '$port/present-proof-2.0/records',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RecordsResponse.fromJson(_result.data);
    return value;
  }
}
