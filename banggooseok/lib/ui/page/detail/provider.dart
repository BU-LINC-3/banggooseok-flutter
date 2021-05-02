import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/repository/banggooseok/repository.dart';

class DetailProvider {

    final BanggooseokRepository _banggooseokRepository = BanggooseokRepository();

    ObservableData<Room> _room;

    void requestRoom(int roomId) {
        _banggooseokRepository.getRoom(roomId: roomId).then((value) {
            _room.setData(value);
        });
    }

    ObservableData<Room> get getRoom {
        if (_room == null) {
            _room = ObservableData();
        }
        
        return _room;
    }

}
