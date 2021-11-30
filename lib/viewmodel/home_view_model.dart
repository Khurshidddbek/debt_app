import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  late ScrollController scrollController;
  bool isScrolled = false;

  List<dynamic> debtList = [];
}
