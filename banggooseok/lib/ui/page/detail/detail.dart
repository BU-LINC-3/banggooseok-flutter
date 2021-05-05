import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/ui/page/detail/provider.dart';
import 'package:banggooseok/ui/widget/appbar.dart';
import 'package:banggooseok/ui/widget/backdrop.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
    
    final roomId;

    DetailPage(this.roomId);

    @override
    _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {

    final DetailProvider provider = DetailProvider();

    Room room;
    int current;

    @override
    void initState() {
        super.initState();
        _initObservers();

        provider.requestRoom(widget.roomId);
    }

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();
        current = 0;
    }

    void _initObservers() {
        provider.getRoom.addObserver(Observer((Room room) {
            setState(() {
                this.room = room;
            });
        }));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomAppBar(
                collapsed: false, 
                backdrop: room == null ? null : BackdropWidget(room),
                body: _bodyWidget(),
                title: Text(""),
            ),
            bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: _bottomBarWidget(),
            ),
        );
    }

    Widget _bodyWidget() {
        return SliverList(
            delegate: SliverChildListDelegate(
                [
                    ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Text("TestTextForProfileImage"),
                            ),
                        ),
                        title: Text('NAME'),
                        subtitle: Text('DESCRIPTION'),
                    ),
                    _bodyDetailWidget(),
                ],
            ),
        );
    }

            ),

    Widget _bottomBarWidget() {
        return Container(
            color: Colors.red,
            child: Center(
                child: Text(
                    "거래하기",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                    ),
                ),
  Widget _bodyDetailWidget() {
    return Container(
      child: Column(
        children: [
          //여기서 작업 하시면 됩니다. 매물 정보는 room에 있습니다. ex) room.address
          Padding(
            padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
            child: Wrap(
              //화면크기에 맞춰 자동으로 줄바꿈 조정
              children: [
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: ("제목: " + room.title + '\n\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      TextSpan(
                          text: '도로명 주소: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.address + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '거래 종류: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.transType.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '월세: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.fee.toString() + "      "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '보증금: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.deposit.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '관리비: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.manageFee.toString() + "      "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '관리비 항목: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.manageTags.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '매물 층: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.floor.toString() + "       "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '건물 층수: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.constFloor.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '방 개수: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.constType.toString() + "       "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '난방 종류: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.tempSys.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '옵션: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.options.toString() + "      "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '엘리베이터: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.elevator.toString() + "     "),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '주차 공간: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.parking.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '입주 가능 일자: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.availDate.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17)),
                      TextSpan(
                          text: '거래 완료 여부: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.transDone.toString() + '\n'),
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              color: Colors.red)),
                      TextSpan(
                          text: '연락처: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      TextSpan(
                          text: (room.contact),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.blue)),
                    ],
                  ),
                )
              ],
            ),
        );
    }
          ),
        ],
      ),
    );
  }
}
