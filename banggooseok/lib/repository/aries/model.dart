import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RecordsResponse {

    List<Record> results;

    RecordsResponse({this.results});

    factory RecordsResponse.fromJson(Map<String, dynamic> json) => _$RecordsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$RecordsResponseToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Record {

    String presExId;

    Record({this.presExId});

    factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

    Map<String, dynamic> toJson() => _$RecordToJson(this);
    
}
