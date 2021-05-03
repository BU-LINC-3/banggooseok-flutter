import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/ui/page/detail/provider.dart';
import 'package:banggooseok/ui/widget/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                backdrop: _backdropWidget(),
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

    Widget _backdropWidget() {
        return Container(
            child: room == null ? null : Stack(
                children: [
                    Hero(
                        tag: room.id,
                        child: CarouselSlider(
                            options: CarouselOptions(
                                    height: MediaQuery.of(context).size.width,
                                    initialPage: 0,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reson) {
                                        setState(() {
                                            current = index;
                                        });
                                    }),
                            items: room.images.map(
                                (map) {
                                    return Image.network(
                                        RoomImage.IMAGE_BASE_URL + map.path,
                                        width: MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                    );
                                },
                            ).toList(),
                        ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: room.images.map((map) {
                                return Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: current == room.images.indexOf(map)
                                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                                : Color.fromRGBO(0, 0, 0, 0.4),
                                    ),
                                );
                            }).toList(),
                        ),
                    ),
                ],
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
