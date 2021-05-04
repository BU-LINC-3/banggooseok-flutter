import 'package:banggooseok/ui/page/home/home.dart';
import 'package:banggooseok/ui/page/submit/submit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakao_flutter_sdk/all.dart';

class BasePage extends StatefulWidget {
    @override
    _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
    int _currentPageIndex;

    @override
    void initState() {
        super.initState();
        _currentPageIndex = 0;
    }

    @override
    Widget build(BuildContext context) {
        _getUser();
        return Scaffold(
            body: _bodyWidget(),
            bottomNavigationBar: _botomNavigationBarwidget(),
        );
    }

    Future _getUser() async {
        try {
            User user = await UserApi.instance.me();
            print(user.toString());
        } on KakaoAuthException catch (e) {
            throw e;
        }
    }

    Widget _bodyWidget() {
        switch (_currentPageIndex) {
            case 0:
                return HomePage();
                break;
            case 1:
                return SubmitPage();
                break;
            case 2:
                return Container();
                break;
            case 3:
                return Container();
                break;
            case 4:
                return Container();
                break;
        }
        return Container();
    }

    Widget _botomNavigationBarwidget() {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
                print(index);
                setState(() {
                    _currentPageIndex = index;
                });
            },
            selectedFontSize: 12,
            currentIndex: _currentPageIndex,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(color: Colors.black),
            items: [
                _bottomNavigationBarItem("home", "홈"),
                _bottomNavigationBarItem("notes", "매물등록"),
                _bottomNavigationBarItem("location", "내 근처"),
                _bottomNavigationBarItem("chat", "채팅"),
                _bottomNavigationBarItem("user", "내정보"),
            ],
        );
    }

    BottomNavigationBarItem _bottomNavigationBarItem(
            String iconName, String label) {
        return BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22),
            ),
            activeIcon: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 22),
            label: label,
        );
    }

    void selectTab(int index) {
        setState(() {
            _currentPageIndex = index;
        });
    }
}
