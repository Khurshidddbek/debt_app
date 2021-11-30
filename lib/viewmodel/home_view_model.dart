import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/services/firestore_service/debt_service.dart';

class HomeViewModel extends ChangeNotifier {
  late ScrollController scrollController;
  bool isScrolled = false;

  bool isLoading = false;

  List<dynamic>? debtList = [];

  loadDebtList() {
    print('LOAD DEBT LIST');
    isLoading = true;
    notifyListeners();

    DebtService.loadDebtList().then((value) {
      print('LOAD DEBT LIST VALUE : $value');
      debtList = value!;
      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }
}
