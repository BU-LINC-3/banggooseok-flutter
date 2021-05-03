import 'package:banggooseok/ui/page/base/base.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/user.dart';

class LoginPage extends StatefulWidget {
    LoginPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    bool _isKakaoTalkInstalled = false;

    @override
    void dispose() {
        super.dispose();
    }

    @override
    void initState() {
        super.initState();
        _initKakaoTalkInstalled();
    }

    _initKakaoTalkInstalled() async {
        final installed = await isKakaoTalkInstalled();
        print('kakao Install : ' + installed.toString());

        setState(() {
            _isKakaoTalkInstalled = installed;
        });
    }

    _issueAccessToken(String authCode) async {
        try {
            var token = await AuthApi.instance.issueAccessToken(authCode);
            AccessTokenStore.instance.toStore(token);
            print(token);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasePage()),
            );
        } catch (e) {
            print("error on issuing access token: $e");
        }
    }

    _loginWithKakao() async {
        try {
            var code = await AuthCodeClient.instance.request();
            await _issueAccessToken(code);
        } catch (e) {
            print(e);
        }
    }

    _loginWithTalk() async {
        try {
            var code = await AuthCodeClient.instance.requestWithTalk();
            await _issueAccessToken(code);
        } catch (e) {
            print(e);
        }
    }

    logOutTalk() async {
        try {
            var code = await UserApi.instance.logout();
            print(code.toString());
        } catch (e) {
            print(e);
        }
    }

    unlinkTalk() async {
        try {
            var code = await UserApi.instance.unlink();
            print(code.toString());
        } catch (e) {
            print(e);
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("방구석"),
                elevation: 0.0,
                actions: [],
            ),
            body: Center(
                child: ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            "카카오계정 로그인",
                            style: TextStyle(
                                fontSize: 24,
                            ),
                        ),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: _isKakaoTalkInstalled
                            ? _loginWithTalk
                            : _loginWithKakao
                ),
            ),
        );
    }
}
