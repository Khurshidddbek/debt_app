import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/model/debt_model.dart';
import 'package:qarz_app/services/firestore_service/debt_service.dart';

class HomeViewModel extends ChangeNotifier {
  late ScrollController scrollController;
  bool isScrolled = false;

  bool isLoading = false;

  List<Debt>? debtList;

  double sumOfDebts = 0;
  double sumOfGivenDebts = 0;

  loadDebtList() {
    print('LOAD DEBT LIST');
    isLoading = true;
    notifyListeners();

    DebtService.loadDebtList().then((value) {
      print('LOAD DEBT LIST VALUE : $value');
      debtList = value;

      if (debtList != null) {
        for (int i = 0; i < debtList!.length; i++) {
          if (debtList![i].gave == 'true') {
            sumOfGivenDebts += double.parse(debtList![i].sum);
          } else {
            print(debtList![i].sum);
            sumOfDebts += double.parse(debtList![i].sum);
          }
        }
      }

      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }
}
