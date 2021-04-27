class RoomList {
    
    int pageMax;
    int roomsLength;

    List<RoomSimple> rooms;

    RoomList({
        this.pageMax, this.roomsLength, this.rooms
    });

    factory RoomList.fromJson(Map<String, dynamic> json) {

        return RoomList(
            pageMax: json['page_max'],
            roomsLength: json['rooms_length'],
            rooms: (json['rooms'] as List)?.map((e) => RoomSimple.fromJson(e))?.toList(),
        );
    }

}

// 매물 목록을 위한 Simple Model 입니다.
class RoomSimple {

    int id;
    String title;
    String address;
    int fee;
    int favCount;

    RoomSimple({
        this.id,
        this.title,
        this.address,
        this.fee,
        this.favCount,
    });

    factory RoomSimple.fromJson(Map<String, dynamic> json) {

        return RoomSimple(
            id: json['id'],
            title: json['title'],
            address: json['address'],
            fee: json['fee'],
            favCount: json['fav_count'],
        );
    }

}

// TODO: 상세 정보에 맞게 Model 작성해 주세요.
class Room {

    int id;
    String title;
    String address;
    int fee;
    int favCount;

    Room({
        this.id,
        this.title,
        this.address,
        this.fee,
        this.favCount,
    });

    factory Room.fromJson(Map<String, dynamic> json) {
        
        return Room(
            id: json['id'],
            title: json['title'],
            address: json['address'],
            fee: json['fee'],
            favCount: json['fav_count'],
        );
    }

}