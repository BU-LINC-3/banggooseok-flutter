import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/ui/page/home/provider.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/ui/page/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
    
    final HomeProvider provider = HomeProvider();

    ScrollController _scrollController = ScrollController();

    int page = 0;
    bool _loading = false;

    RoomList roomList;

    @override
    void initState() {
        super.initState();

        _initObservers();
        _initEventListeners();

        provider.requestRoomList(page);
    }

    void _initObservers() {
        provider.getRoomList.addObserver(Observer((RoomList value) {
            setState(() {
                if (roomList == null) {
                    roomList = value;
                } else {
                    roomList.rooms.addAll(value.rooms);
                    roomList.roomsLength += value.roomsLength;
                    _loading = false;
                }
            });
        }));
    }

    void _initEventListeners() {
        _scrollController.addListener(() {
            double max = _scrollController.position.maxScrollExtent;
            double current = _scrollController.position.pixels;
            if (max - current <= 50.0 && !_loading) {
                _loading = true;
                provider.requestRoomList(++page);
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: _appbarWidget(),
            body: _bodyWidget(),
        );
    }

    final oCcy = new NumberFormat("#,###", "ko_KR");
    String calcStringToWon(String priceString) {
        if (priceString == "집주인과 합의") return priceString;
        return "${oCcy.format(int.parse(priceString))}원";
    }

    Widget _appbarWidget() {
        return AppBar(
            automaticallyImplyLeading: false,
            title: Row(
                children: [
                    Text("방구석"),
                ],
            ),
            elevation: 0.0,
            actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                IconButton(icon: Icon(Icons.tune), onPressed: () {}),
                IconButton(
                    icon: SvgPicture.asset(
                        "assets/svg/bell.svg",
                        width: 22,
                    ),
                    onPressed: () {}
                ),
            ],
        );
    }

    Widget _bodyWidget() {
        return roomList == null ? null : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (BuildContext _context, int index) {
                return GestureDetector(
                    onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (BuildContext context) 
                                    => DetailPage(roomList.rooms[index].id)
                            )
                        );
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                            children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    child: Hero(
                                        tag: roomList.rooms[index].id,
                                        child: Image.network(
                                            RoomImage.IMAGE_BASE_URL + roomList.rooms[index].images[0].path,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                        ),
                                    ),
                                ),
                                Expanded(
                                    child: Container(
                                        height: 100,
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                    roomList.rooms[index].title,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                    height: 5,
                                                ),
                                                Text(
                                                    roomList.rooms[index].address,
                                                    style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black.withOpacity(0.3)),
                                                ),
                                                SizedBox(
                                                    height: 5,
                                                ),
                                                Text(
                                                    calcStringToWon(roomList.rooms[index].fee.toString()),
                                                    style: TextStyle(fontWeight: FontWeight.w500),
                                                ),
                                                Expanded(
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                            SvgPicture.asset(
                                                                "assets/svg/heart_off.svg",
                                                                width: 13,
                                                                height: 13,
                                                            ),
                                                            SizedBox(
                                                                width: 5,
                                                            ),
                                                            Text(roomList.rooms[index].favCount.toString()),
                                                        ],
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                );
            },
            controller: _scrollController,
            itemCount: roomList.roomsLength,
            separatorBuilder: (BuildContext _context, int index) {
                return Container(
                    height: 1,
                    color: Colors.black.withOpacity(0.4),
                );
            },
        );
    }
}
