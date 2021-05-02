import 'dart:core';

class RoomList {

    int pageMax;
    int roomsLength;

    List<RoomSimple> rooms;

    RoomList({this.pageMax, this.roomsLength, this.rooms});

    factory RoomList.fromJson(Map<String, dynamic> json) {
        return RoomList(
            pageMax: json['page_max'],
            roomsLength: json['rooms_length'],
            rooms: (json['rooms'] as List)?.map((e) => RoomSimple.fromJson(e))?.toList(),
        );
    }
}

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

    factory RoomSimple.fromJson(Map<String, dynamic> json) {
        return RoomSimple(
            id: json['id'],
            title: json['title'],
            transType: json['trans_type'],
            deposit: json['deposit'],
            fee: json['fee'],
            floor: json['floor'],
            constType: json['const_type'],
            address: json['address'],
            images: (json['images'] as List)
                    ?.map((e) => RoomImage.fromJson(e))
                    ?.toList(),
            timestamp: json['timestamp'],
            transDone: json['trans_done'],
            favCount: json['fav_count'],
        );
    }
}

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

    factory Room.fromJson(Map<String, dynamic> json) {
        return Room(
            id: json['id'],
            userId: json['user_id'],
            title: json['title'],
            description: json['description'],
            transType: json['trans_type'],
            deposit: json['deposit'],
            fee: json['fee'],
            manageFee: json['manage_fee'],
            manageTags: json['manage_tags'],
            floor: json['floor'],
            constFloor: json['const_floor'],
            constType: json['const_type'],
            validDimen: json['valid_dimen'],
            supplyDimen: json['supply_dimen'],
            availDate: json['avali_date'],
            options: json['options'],
            elevator: json['elevator'],
            parking: json['parking'],
            tempSys: json['temp_sys'],
            address: json['address'],
            images: (json['images'] as List)
                    ?.map((e) => RoomImage.fromJson(e))
                    ?.toList(),
            timestamp: json['timestamp'],
            transDone: json['trans_done'],
            favCount: json['fav_count'],
        );
    }
}

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

    factory RoomImage.fromJson(Map<String, dynamic> json) {
        return RoomImage(
            id: json['id'],
            userId: json['user_id'],
            path: json['path'],
            timestamp: json['timestamp'],
        );
    }
}
