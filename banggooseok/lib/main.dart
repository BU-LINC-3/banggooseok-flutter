import 'package:banggooseok/ui/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/user.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        KakaoContext.clientId = "666d81e2b81db2b86ce399034e19bf47";
        KakaoContext.javascriptClientId = "9ae9abd30eee57a7959e6abe3d148b81";
        
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "방구석",
            theme: ThemeData(
                primaryColor: Colors.white,
                primarySwatch: Colors.blue,
            ),
            home: LoginPage(),
            // home: ChangeNotifierProvider(
            //     create: (BuildContext context) => HomeProvider(),
            //     child: KakaoLogin(),
            // ),
        );
    }
}
