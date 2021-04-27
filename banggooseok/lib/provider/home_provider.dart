import 'package:banggooseok/repository/model.dart';
import 'package:banggooseok/repository/contents_repository.dart';
import 'package:flutter/material.dart';
import 'package:banggooseok/observable.dart';

class HomeProvider extends ChangeNotifier {

    final ContentsRepository _contentsRepository = ContentsRepository();

    ObservableData<List<RoomSimple>> _roomData;

    void requestRoomList(int page) {
        _contentsRepository.getRoomData(page: page).then((value) {
            _roomData.setData(value);
        });
    }

    ObservableData<List<RoomSimple>> get getRoomList {
        if (_roomData == null) {
            _roomData = ObservableData();
        }
        
        return _roomData;
    }

}
