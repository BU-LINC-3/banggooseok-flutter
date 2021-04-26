import 'package:banggooseok/repository/model.dart';
import 'package:banggooseok/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:banggooseok/observable.dart';

// observer data 를 불러오면서 null

class HomeProvider extends ChangeNotifier {
  final ContentsRepository _contentsRepository = ContentsRepository();

  ObservableData<List<RoomData>> _roomData;

  void getRoomData(int id) {
    _contentsRepository.getRoomData(page: id).then((value) {
      _roomData.setData(value);
    });
  }

  // Future<List<Map<String, String>>> loadContentsFromLocation(
  //     String location) async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   return _roomData;
  // }

  ObservableData<List<RoomData>> get getroomData {
    if (_roomData == null) {
      _roomData = ObservableData();
    }
    return _roomData;
  }
}
