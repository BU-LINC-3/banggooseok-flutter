import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/repository/banggooseok/repository.dart';

class HomeProvider {

    final BanggooseokRepository _banggooseokRepository = BanggooseokRepository();

    ObservableData<RoomList> _roomList;

    void requestRoomList(int page) {
        _banggooseokRepository.getRoomList(page: page).then((value) {
            _roomList.setData(value);
        });
    }

    ObservableData<RoomList> get getRoomList {
        if (_roomList == null) {
            _roomList = ObservableData();
        }
        
        return _roomList;
    }

}
