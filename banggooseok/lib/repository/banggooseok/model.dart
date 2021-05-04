import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RoomList {

    int pageMax;
    int roomsLength;

    List<RoomSimple> rooms;

    RoomList({this.pageMax, this.roomsLength, this.rooms});

    factory RoomList.fromJson(Map<String, dynamic> json) => _$RoomListFromJson(json);

    Map<String, dynamic> toJson() => _$RoomListToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RoomSimple {

    int id;
    String title;
    int transType;
    int deposit;
    int fee;
    int floor;
    int constType;
    String address;
    List<RoomImage> images;
    int timestamp;
    bool transDone;
    int favCount;

    RoomSimple({
        this.id,
        this.title,
        this.transType,
        this.deposit,
        this.fee,
        this.floor,
        this.constType,
        this.address,
        this.images,
        this.timestamp,
        this.transDone,
        this.favCount,
    });

    factory RoomSimple.fromJson(Map<String, dynamic> json) => _$RoomSimpleFromJson(json);

    Map<String, dynamic> toJson() => _$RoomSimpleToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Room {

    int id;
    int userId;
    String title;
    String description;
    int transType;
    int deposit;
    int fee;
    int manageFee;
    List<String> manageTags;
    int floor;
    int constType;
    int constFloor;
    double validDimen;
    double supplyDimen;
    int availDate;
    List<String> options;
    bool elevator;
    int parking;
    int tempSys;
    String contact;
    String address;
    List<RoomImage> images;
    int timestamp;
    bool transDone;
    int favCount;

    Room({
        this.id,
        this.userId,
        this.title,
        this.description,
        this.transType,
        this.deposit,
        this.fee,
        this.manageFee,
        this.manageTags,
        this.floor,
        this.constFloor,
        this.constType,
        this.validDimen,
        this.supplyDimen,
        this.availDate,
        this.options,
        this.elevator,
        this.parking,
        this.tempSys,
        this.contact,
        this.address,
        this.images,
        this.timestamp,
        this.transDone,
        this.favCount,
    });

    factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

    Map<String, dynamic> toJson() => _$RoomToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RoomImage {

    static final IMAGE_BASE_URL = "http://34.64.218.185/image";

    int id;
    int userId;
    String path;
    int timestamp;

    RoomImage({
        this.id,
        this.userId,
        this.path,
        this.timestamp,
    });

    factory RoomImage.fromJson(Map<String, dynamic> json) => _$RoomImageFromJson(json);

    Map<String, dynamic> toJson() => _$RoomImageToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class SubmitResponse {

    int roomId;

    SubmitResponse({this.roomId});

    factory SubmitResponse.fromJson(Map<String, dynamic> json) => _$SubmitResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SubmitResponseToJson(this);

}