// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomList _$RoomListFromJson(Map<String, dynamic> json) {
  return RoomList(
    pageMax: json['page_max'] as int,
    roomsLength: json['rooms_length'] as int,
    rooms: (json['rooms'] as List)
        ?.map((e) =>
            e == null ? null : RoomSimple.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoomListToJson(RoomList instance) => <String, dynamic>{
      'page_max': instance.pageMax,
      'rooms_length': instance.roomsLength,
      'rooms': instance.rooms,
    };

RoomSimple _$RoomSimpleFromJson(Map<String, dynamic> json) {
  return RoomSimple(
    id: json['id'] as int,
    title: json['title'] as String,
    transType: json['trans_type'] as int,
    deposit: json['deposit'] as int,
    fee: json['fee'] as int,
    floor: json['floor'] as int,
    constType: json['const_type'] as int,
    address: json['address'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : RoomImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['timestamp'] as int,
    transDone: json['trans_done'] as bool,
    favCount: json['fav_count'] as int,
  );
}

Map<String, dynamic> _$RoomSimpleToJson(RoomSimple instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'trans_type': instance.transType,
      'deposit': instance.deposit,
      'fee': instance.fee,
      'floor': instance.floor,
      'const_type': instance.constType,
      'address': instance.address,
      'images': instance.images,
      'timestamp': instance.timestamp,
      'trans_done': instance.transDone,
      'fav_count': instance.favCount,
    };

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    transType: json['trans_type'] as int,
    deposit: json['deposit'] as int,
    fee: json['fee'] as int,
    manageFee: json['manage_fee'] as int,
    manageTags:
        (json['manage_tags'] as List)?.map((e) => e as String)?.toList(),
    floor: json['floor'] as int,
    constFloor: json['const_floor'] as int,
    constType: json['const_type'] as int,
    validDimen: (json['valid_dimen'] as num)?.toDouble(),
    supplyDimen: (json['supply_dimen'] as num)?.toDouble(),
    availDate: json['avail_date'] as int,
    options: (json['options'] as List)?.map((e) => e as String)?.toList(),
    elevator: json['elevator'] as bool,
    parking: json['parking'] as int,
    tempSys: json['temp_sys'] as int,
    contact: json['contact'] as String,
    address: json['address'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : RoomImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timestamp: json['timestamp'] as int,
    transDone: json['trans_done'] as bool,
    favCount: json['fav_count'] as int,
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'trans_type': instance.transType,
      'deposit': instance.deposit,
      'fee': instance.fee,
      'manage_fee': instance.manageFee,
      'manage_tags': instance.manageTags,
      'floor': instance.floor,
      'const_type': instance.constType,
      'const_floor': instance.constFloor,
      'valid_dimen': instance.validDimen,
      'supply_dimen': instance.supplyDimen,
      'avail_date': instance.availDate,
      'options': instance.options,
      'elevator': instance.elevator,
      'parking': instance.parking,
      'temp_sys': instance.tempSys,
      'contact': instance.contact,
      'address': instance.address,
      'images': instance.images,
      'timestamp': instance.timestamp,
      'trans_done': instance.transDone,
      'fav_count': instance.favCount,
    };

RoomImage _$RoomImageFromJson(Map<String, dynamic> json) {
  return RoomImage(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    path: json['path'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$RoomImageToJson(RoomImage instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'path': instance.path,
      'timestamp': instance.timestamp,
    };
