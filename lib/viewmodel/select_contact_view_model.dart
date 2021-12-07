import 'package:flutter/material.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/services/firestore_service/contact_data_serivce.dart';

class SelectContactViewModel extends ChangeNotifier {
  bool isLoading = false;

  List<Contact>? contactsList;

  loadContacts() {
    print('LOADCONTACTS');
    isLoading = true;
    notifyListeners();

    ContactDataService.loadContactsList().then((value) {
      print('LOADCONTACTS VALUE : $value');
      contactsList = value;
      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }
}
