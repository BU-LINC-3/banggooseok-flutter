import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/tool/tool.dart';
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

    Widget _bodyDetailWidget() {
        return Padding (
            padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
            child: room == null ? null : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    _bodyTitle(
                        text: room.title,
                    ),
                    _bodyHeader(
                        text: "주소(도로명)",
                    ),
                    _bodyContents(
                        text: room.address,
                    ),
                    Row(
                        children: [
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [               
                                        _bodyHeader(
                                            text: room.transType == 1 
                                                ? "월세"
                                                : room.transType == 2
                                                    ? "전세"
                                                    : "년세",
                                        ),
                                        _bodyContents(
                                            text: Tool.calcStringToWon(room.fee),
                                        ),
                                    ],
                                ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        _bodyHeader(
                                            text: "보증금",
                                        ),
                                        _bodyContents(
                                            text: room.deposit == null || room.deposit == 0 
                                                ? "없음" 
                                                : Tool.calcStringToWon(room.deposit),
                                        ),
                                    ],
                                ),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                        _bodyHeader(
                                            text: "관리비",
                                        ),
                                        _bodyContents(
                                            text: Tool.calcStringToWon(room.manageFee),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                    _bodyHeader(
                        text: "연락처",
                    ),
                    _bodyContents(
                        text: room.contact,
                        color: Colors.blue
                    ),
                    _bodyHeader(
                        text: "설명",
                    ),
                    _bodyContents(
                        text: room.description,
                    ),
                ]
            ),
        );
    }

    Widget _bodyTitle({String text, EdgeInsetsGeometry padding = const EdgeInsets.only(top: 24), Color color = Colors.black}) {
        return Padding(
            padding: padding,
            child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: color,
                ),
            ),
        );
    }

    Widget _bodyHeader({String text, EdgeInsetsGeometry padding = const EdgeInsets.only(top: 24), Color color = Colors.black}) {
        return Padding(
            padding: padding,
            child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: color,
                ),
            ),
        );
    }

    Widget _bodyContents({String text, EdgeInsetsGeometry padding = const EdgeInsets.only(top: 4), Color color = Colors.black}) {
        return Padding(
            padding: padding,
            child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: color,
                ),
            ),
        );
    }

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
            ),
        );
    }

}