import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:banggooseok/repository/model.dart';
import 'package:banggooseok/repository/kakao_model.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:banggooseok/observable.dart';
import 'package:provider/provider.dart';

class DetailContentView extends StatefulWidget {
  final RoomSimple roomdata;
  final UserList userList;
  const DetailContentView({Key key, this.roomdata, this.userList})
      : super(key: key);
  @override
  _DetailContentViewState createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView>
    with SingleTickerProviderStateMixin {
  Size size;
  List<Map<String, String>> imgList;
  Map<String, String> properties;
  int _current;

  @override
  void initState() {
    super.initState();
    UserList.fromJson(properties);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {
        "id": "0",
        "url": 'http://34.64.218.185/image' + widget.roomdata.images[0].path
      },
      {
        "id": "1",
        "url": 'http://34.64.218.185/image' + widget.roomdata.images[0].path
      },
      {
        "id": "2",
        "url": 'http://34.64.218.185/image' + widget.roomdata.images[0].path
      },
      {
        "id": "3",
        "url": 'http://34.64.218.185/image' + widget.roomdata.images[0].path
      },
      {
        "id": "4",
        "url": 'http://34.64.218.185/image' + widget.roomdata.images[0].path
      },
    ];
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

  Widget _makeSliderImage() {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.roomdata.id,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: size.width,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reson) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imgList.map(
                (map) {
                  return Image.network(
                    map["url"],
                    width: size.width,
                    fit: BoxFit.fill,
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
              children: imgList.map((map) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == int.parse(map["id"])
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

  Widget _sellerSimpleInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 50,
            height: 50,
            child: Image.network(properties["profile_image_url"]),
          ),
        )
      ],
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      height: 55,
      width: size.width,
      color: Colors.red,
    );
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
}

// return Container(
//   child: Center(
//     child: Text(widget.roomdata.title),
//   ),
// );
