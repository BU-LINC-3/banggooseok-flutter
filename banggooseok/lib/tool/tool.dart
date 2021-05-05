import 'package:intl/intl.dart';

class Tool {
    static String calcStringToWon(int price) {
        return "${NumberFormat("#,###", "ko_KR").format(price)}원";
    }
}