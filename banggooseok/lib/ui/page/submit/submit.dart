import 'dart:io';

import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/ui/page/detail/detail.dart';
import 'package:banggooseok/ui/page/submit/provider.dart';
import 'package:banggooseok/ui/widget/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubmitPage extends StatefulWidget {
    @override
    _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {

    final GlobalKey<FormState> _roomFormKey = GlobalKey<FormState>();

    final _typeList = ["월세", "전세", "년세"];

    String _token;

    ImagePicker imagePicker = ImagePicker();
    SubmitProvider provider = SubmitProvider();

    Room room = Room();

    @override
    void initState() {
        super.initState();
        _initViews();
        _initObservers();
        
        provider.requestToken();
        provider.requestUserId();
    }

    void _initViews(){
        setState(() {
            room.transType = 1;
        });
    }

    void _initObservers() {
        provider.getToken.addObserver(Observer((String value) {
            setState(() {
                _token = value;
            });
        }));

        provider.getUserId.addObserver(Observer((int value) {
            setState(() {
                room.userId = value;
            });
        }));

        provider.getRoomId.addObserver(Observer((int value) {
            setState(() {
                room.id = value;
            });
        }));

        provider.getRoomImage.addObserver(Observer((RoomImage value) {
            if (room.images == null) {
                room.images = [];
            }
            setState(() {
                room.images.add(value);
            });
        }));
    }

    @override
    Widget build(BuildContext context) {
        return room.id == null ? _bodyForm() : _bodyImageUpload();
    }

    Widget _bodyForm() {
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("매물 등록"),
                elevation: 0,
            ),
            body: Padding(
                padding: EdgeInsets.fromLTRB(24, 5, 24, 5),
                child: Form(
                    key: _roomFormKey,
                    child: ListView(
                        children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "제목",
                                    ),
                                    maxLength: 30,
                                    validator: (String value) => _validate(value, "제목을 입력해주세요."),
                                    onChanged: (value) {
                                        room.title = value;
                                    },
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 24),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "도로명 주소",
                                    ),
                                    maxLength: 100,
                                    validator: (String value) => _validate(value, "주소를 입력해주세요."),
                                    onChanged: (value) {
                                        room.address = value;
                                    },
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Center(
                                    child: Wrap(
                                        children: List<Widget>.generate(3, (index) {
                                            return Padding(
                                                padding: EdgeInsets.only(left: 10, right: 10),
                                                child: ChoiceChip(
                                                    padding: EdgeInsets.only(left: 24, right: 24),
                                                    selectedColor: Colors.teal,
                                                    label: Text(_typeList[index]),
                                                    selected: room.transType == index + 1,
                                                    onSelected: (bool selected) {
                                                        setState(() {
                                                            room.transType = index + 1;
                                                        });
                                                    },
                                                ),
                                            );
                                        }).toList(),
                                    ),
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 24),
                                child: Row(
                                    children: [
                                        Expanded(
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                    hintText: "세 가격 (원 단위 숫자)",
                                                ),
                                                maxLength: 9,
                                                validator: (String value) => _validate(value, "가격을 입력해주세요."),
                                                onChanged: (value) {
                                                    room.fee = int.parse(value);
                                                },
                                            ),
                                        ),
                                        SizedBox(
                                            width: 10,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                                decoration: InputDecoration(
                                                    hintText: "보증금 (원 단위 숫자)",
                                                ),
                                                maxLength: 9,
                                                onChanged: (value) {
                                                    room.deposit = int.parse(value);
                                                },
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 24),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "관리비 (원 단위 숫자)",
                                    ),
                                    maxLength: 9,
                                    onChanged: (value) {
                                        room.manageFee = int.parse(value);
                                    },
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "기타 설명",
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    maxLength: 1000,
                                    validator: (String value) => _validate(value, "설명을 입력해주세요."),
                                    onChanged: (value) {
                                        room.description = value;
                                    },
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "연락처 (전화번호, 이메일, 링크 등)",
                                    ),
                                    maxLength: 500,
                                    validator: (String value) => _validate(value, "연락처를 입력해주세요."),
                                    onChanged: (value) {
                                        room.contact = value;
                                    },
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            bottomNavigationBar: Container(
                height: kToolbarHeight,
                child: ElevatedButton(
                    onPressed: () {
                        if (_roomFormKey.currentState.validate()) {
                            provider.postRoom(_token, room.userId, room);
                        }
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: Text(
                        "매물 등록하기",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                        ),
                    ),
                ),
            ),
        );
    }

    Widget _bodyImageUpload() {
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("매물 이미지 등록"),
                elevation: 0,
            ),
            body: Column(
                children: [
                    BackdropWidget(room),
                    Expanded(
                        child: Center(
                            child: Container(
                                width: kToolbarHeight * 1.5,
                                height: kToolbarHeight * 1.5,
                                child: ElevatedButton(
                                    onPressed: () {
                                        _getImageFromDevice((value) {
                                            provider.postImage(room.id, _token, room.userId, value);
                                        });
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                    ),
                                    child: Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                ],
            ),
            bottomNavigationBar: Container(
                width: double.infinity,
                height: kToolbarHeight,
                child: ElevatedButton(
                    onPressed: () {
                        if (room.images != null && room.images.length != 0) {
                            room.transType = 1;
                            int id = room.id;
                            Navigator.push(
                                context,
                                MaterialPageRoute(maintainState: false, builder: (context) => DetailPage(id)),
                            );
                            setState(() {
                                room = Room();
                            });
                        }
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    ),
                    child: Text(
                        "완료",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                        ),
                    ),
                ),
            ),
        );
    }

    String _validate(String value, String string) {
        if (value == null || value.isEmpty) {
            return string;
        }
        return null;
    }

    Future _getImageFromDevice(callback) async {
        PickedFile pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
        
        if (pickedFile != null) {
            callback(File(pickedFile.path));
        }
    }
}
