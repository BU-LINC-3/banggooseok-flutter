class RoomData {
  int id;
  String title;
  String address;
  int fee;
  int favCount;

  RoomData({
    this.id,
    this.title,
    this.address,
    this.fee,
    this.favCount,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      id: json['id'],
      title: json['title'],
      address: json['address'],
      fee: json['fee'],
      favCount: json['fav_count'],
    );
  }
}
