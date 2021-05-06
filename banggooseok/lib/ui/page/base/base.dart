import 'package:banggooseok/arch/observable.dart';
import 'package:banggooseok/repository/aries/model.dart';
import 'package:banggooseok/repository/banggooseok/model.dart';
import 'package:banggooseok/ui/page/base/provider.dart';
import 'package:banggooseok/ui/page/home/home.dart';
import 'package:banggooseok/ui/page/submit/submit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasePage extends StatefulWidget {
    @override
    _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
    
    SharedPreferences _prefs;
    BaseProvider provider = BaseProvider();

    int _currentPageIndex, _port, _state;
    String _token, _alias, _presExId, _error;

    @override
    void initState() {
        super.initState();
        _init();
        _initObservers();
    }

    void _init() {
        _currentPageIndex = 0;
        _state = 2;

        SharedPreferences.getInstance().then((value) {
            _prefs = value;

            try {
                _alias = _prefs.getString("alias");
                _port = _prefs.getInt("port");
            } catch (e) { }

            provider.requestToken();
        });
    }

    void _initObservers() {
        provider.getToken.addObserver(Observer((String value) {
            _token = value;

            if (_alias == null || _port == null) {
                print("Aries: Request agent info from issuer");
                provider.requestIssuerAgent(_token);
            } else {
                print("Aries: Agent Info is valid");
                print("Aries: Request requesting issue from Verifier");
                provider.requestVerifierKnock(_alias);
                setState(() {
                    _state = 1;
                });
            }
        }));

        provider.getAgentResponse.addObserver(Observer((AgentResponse value) {
            _port = value.port;
            _alias = value.alias;
            print("Aries: Request invitation from issuer");
            provider.requestIssuerInv(_token, _alias);
        }));
        
        provider.getInvReponse.addObserver(Observer((String value) {
            print("Aries: Request receive invitation from agent");
            provider.requestHolderReceiveInv(_port, _alias, value);
        }));

        provider.getInvRecResponse.addObserver(Observer((String value) {
            print("Aries: Request credential from issuer");
            try {
                provider.requestIssuerCred(_token, _alias);
            } catch (e) {
                print("Aries: Failed to request credential from issuer");
                setState(() {
                    _error = e.toString();
                });
            }
        }));

        provider.getCredResponse.addObserver(Observer((V20Response value) {
            _prefs.setString("alias", _alias);
            _prefs.setInt("port", _port);
            print("Aries: Request requesting issue from Verifier");
            provider.requestVerifierKnock(_alias);
            setState(() {
                _state = 1;
            });
        }));

        provider.getKnockResponse.addObserver(Observer((V20Response value) {
            _presExId = value.presExId;
            print("Aries: Request presentation records from Holder");
            provider.requestHolderRecords(_port, value.threadId);
        }));

        provider.getRecordsResponse.addObserver(Observer((RecordsResponse value) {
            try {
                print("Aries: Request verifying proof from Verifier");
                provider.requestVerifierVerified(_presExId);
            } catch(e) {
                print("Aries: Failed to request verifying proof from Verifier");
                setState(() {
                    _error = e.toString();
                });
            }
        }));

        provider.getVerifiedResponse.addObserver(Observer((VerifiedResponse value) {
            if (value.verified) {
                print("Aries: Proof is verified");
                setState(() {
                    _state = 0;
                });
            } else {
                Navigator.pop(context);
            }
        }));
    }

    @override
    Widget build(BuildContext context) {
        _getUser();
        return _state > 0 ? Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        _state == 2 
                        ? Text(
                            _error == null ? "자격 증명 발급 중" : _error,
                            style: TextStyle(
                                fontSize: 24,
                            ),
                        ) 
                        : Text(
                            _error == null ? "자격 증명 확인 중" : _error,
                            style: TextStyle(
                                fontSize: 24,
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: CircularProgressIndicator(),
                        ),
                    ],
                ),
            ),
        ) : Scaffold(
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
                return SubmitPage(_presExId);
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
