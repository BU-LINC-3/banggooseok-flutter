import 'dart:io';

import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/repository/banggooseok/repository.dart';
import 'package:kakao_flutter_sdk/all.dart';

class SubmitProvider {

    final BanggooseokRepository _banggooseokRepository = BanggooseokRepository();

    ObservableData<String> _token;
    ObservableData<int> _userId;
    ObservableData<int> _roomId;
    ObservableData<RoomImage> _roomImage;

    void requestToken() {
        AccessTokenStore.instance.fromStore().then((value) {
            _token.setData(value.accessToken);
        });
    }

    void requestUserId() {
        UserApi.instance.me().then((value) {
            _userId.setData(value.id);
        });
    }

    void postRoom(String token, int userId, Room room) {
        _banggooseokRepository.postRoom(token: token, userId: userId, room: room).then((value) {
            _roomId.setData(value.roomId);
        });
    }

    void postImage(int roomId, String token, int userId, File image) {
        _banggooseokRepository.postImage(roomId: roomId, token: token, userId: userId, image: image).then((value) {
            _roomImage.setData(value);
        });
    }

    ObservableData<String> get getToken {
        if (_token == null) {
            _token = ObservableData();
        }
        
        return _token;
    }

    ObservableData<int> get getUserId {
        if (_userId == null) {
            _userId = ObservableData();
        }
        
        return _userId;
    }

    ObservableData<int> get getRoomId {
        if (_roomId == null) {
            _roomId = ObservableData();
        }
        
        return _roomId;
    }

    ObservableData<RoomImage> get getRoomImage {
        if (_roomImage == null) {
            _roomImage = ObservableData();
        }
        
        return _roomImage;
    }

}
