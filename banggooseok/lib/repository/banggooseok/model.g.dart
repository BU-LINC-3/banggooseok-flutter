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

Map<String, dynamic> _$RoomListToJson(RoomList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page_max', instance.pageMax);
  writeNotNull('rooms_length', instance.roomsLength);
  writeNotNull('rooms', instance.rooms);
  return val;
}

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

Map<String, dynamic> _$RoomSimpleToJson(RoomSimple instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('trans_type', instance.transType);
  writeNotNull('deposit', instance.deposit);
  writeNotNull('fee', instance.fee);
  writeNotNull('floor', instance.floor);
  writeNotNull('const_type', instance.constType);
  writeNotNull('address', instance.address);
  writeNotNull('images', instance.images);
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('trans_done', instance.transDone);
  writeNotNull('fav_count', instance.favCount);
  return val;
}

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

Map<String, dynamic> _$RoomToJson(Room instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('trans_type', instance.transType);
  writeNotNull('deposit', instance.deposit);
  writeNotNull('fee', instance.fee);
  writeNotNull('manage_fee', instance.manageFee);
  writeNotNull('manage_tags', instance.manageTags);
  writeNotNull('floor', instance.floor);
  writeNotNull('const_type', instance.constType);
  writeNotNull('const_floor', instance.constFloor);
  writeNotNull('valid_dimen', instance.validDimen);
  writeNotNull('supply_dimen', instance.supplyDimen);
  writeNotNull('avail_date', instance.availDate);
  writeNotNull('options', instance.options);
  writeNotNull('elevator', instance.elevator);
  writeNotNull('parking', instance.parking);
  writeNotNull('temp_sys', instance.tempSys);
  writeNotNull('contact', instance.contact);
  writeNotNull('address', instance.address);
  writeNotNull('images', instance.images);
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('trans_done', instance.transDone);
  writeNotNull('fav_count', instance.favCount);
  return val;
}

RoomImage _$RoomImageFromJson(Map<String, dynamic> json) {
  return RoomImage(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    path: json['path'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$RoomImageToJson(RoomImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('path', instance.path);
  writeNotNull('timestamp', instance.timestamp);
  return val;
}

SubmitResponse _$SubmitResponseFromJson(Map<String, dynamic> json) {
  return SubmitResponse(
    roomId: json['room_id'] as int,
  );
}

Map<String, dynamic> _$SubmitResponseToJson(SubmitResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('room_id', instance.roomId);
  return val;
}

AgentResponse _$AgentResponseFromJson(Map<String, dynamic> json) {
  return AgentResponse(
    port: json['port'] as int,
    alias: json['alias'] as String,
  );
}

Map<String, dynamic> _$AgentResponseToJson(AgentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('port', instance.port);
  writeNotNull('alias', instance.alias);
  return val;
}

V20Response _$V20ResponseFromJson(Map<String, dynamic> json) {
  return V20Response(
    state: json['state'] as String,
    presExId: json['pres_ex_id'] as String,
    threadId: json['thread_id'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$V20ResponseToJson(V20Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.state);
  writeNotNull('pres_ex_id', instance.presExId);
  writeNotNull('thread_id', instance.threadId);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}

VerifiedResponse _$VerifiedResponseFromJson(Map<String, dynamic> json) {
  return VerifiedResponse(
    verified: json['verified'] as bool,
  );
}

Map<String, dynamic> _$VerifiedResponseToJson(VerifiedResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('verified', instance.verified);
  return val;
}
