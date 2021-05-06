// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordsResponse _$RecordsResponseFromJson(Map<String, dynamic> json) {
  return RecordsResponse(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecordsResponseToJson(RecordsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results', instance.results);
  return val;
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    presExId: json['pres_ex_id'] as String,
  );
}

Map<String, dynamic> _$RecordToJson(Record instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pres_ex_id', instance.presExId);
  return val;
}
