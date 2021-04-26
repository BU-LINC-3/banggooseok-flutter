import 'dart:async';
import 'package:banggooseok/observable.dart';
import 'package:banggooseok/repository/contents_repository.dart';
import 'package:banggooseok/repository/model.dart';
import 'package:banggooseok/provider/home_provider.dart';
import 'package:flutter/material.dart';

class HomeListWidget extends StatefulWidget {
  final RoomData roomData;

  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  final HomeProvider dataProvider = HomeProvider();

  @override
  void initState() {
    super.initState();
    initObservers();
    initEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("방구석"),
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, widget) {
        if (provider.roomdata != null && provider.roomdata.length > 0) {
          //return _makeListView(provider.roomdata);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

// import 'dart:async';
// import 'package:banggooseok/observable.dart';
// import 'package:banggooseok/repository/model.dart';
// import 'package:banggooseok/provider/home_provider.dart';
// import 'package:flutter/material.dart';

// class HomeListWidget extends StatefulWidget {
//   @override
//   _HomeListWidgetState createState() => _HomeListWidgetState();
// }

// class _HomeListWidgetState extends State<HomeListWidget>
//     with TickerProviderStateMixin {
//   final HomeProvider dataProvider = HomeProvider();

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
