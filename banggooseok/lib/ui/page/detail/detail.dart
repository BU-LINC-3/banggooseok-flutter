import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/repository/banggooseok/repository.dart';
import 'package:banggooseok/ui/page/detail/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
    
    final roomId;

    DetailContentView(this.roomId);

    @override
    _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> with SingleTickerProviderStateMixin {

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
            extendBodyBehindAppBar: true,
            appBar: _appbarWidget(),
            body: _bodyWidget(),
            bottomNavigationBar: _bottomBarWidget(),
        );
    }

    Widget _appbarWidget() {
        return AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                icon: Icon(
                    Icons.arrow_back,
                ),
            ),
            actions: [
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
        );
    }

    Widget _bodyWidget() {
        return Column(
            children: [
                Container(
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
                ),
                Row(
                    children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                                width: 50,
                                height: 50,
                                // child: Image.network(properties["profile_image_url"]),
                            ),
                        )
                    ],
                ),
            ],
        );
    }

    Widget _bottomBarWidget() {
        return Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
        );
    }
}
