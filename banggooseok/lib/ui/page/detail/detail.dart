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

    Widget _bodyDetailWidget() {
        return Container(
            child: Column(
                children: [
                    //여기서 작업 하시면 됩니다. 매물 정보는 room에 있습니다. ex) room.address
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
                        child: Row(
                            children: [
                                Text("TEST"),
                                Text("TEST"),
                                Text("TEST"),
                                Text("TEST"),
                                Text("TEST"),
                            ],
                        ),
                    ),
                ],
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
