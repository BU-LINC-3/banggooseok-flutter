import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackdropWidget extends StatefulWidget {

    final Room room;

    BackdropWidget(this.room);

    @override
    _BackdropWidgetState createState() => _BackdropWidgetState();
}

class _BackdropWidgetState extends State<BackdropWidget> {

    int current = 0;

    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            child: widget.room.images == null ? null : Stack(
                children: [
                    Hero(
                        tag: widget.room.id,
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
                            items: widget.room.images.map(
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
                            children: widget.room.images.map((map) {
                                return Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: current == widget.room.images.indexOf(map)
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

}
