import 'package:flutter/material.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/services/firestore_service/contact_data_serivce.dart';

class ContactsViewModel extends ChangeNotifier {
  bool isLoading = false;

  var searchController = TextEditingController();

  List<Contact>? contactsList;

  loadContacts() {
    print('LOADCONTACTS in EDITCONTACTSLIST');
    isLoading = true;
    notifyListeners();

    ContactDataService.loadContactsList().then((value) {
      print('LOADCONTACTS in EDITCONTACTSLIST VALUE : $value');
      contactsList = value;

      // Sort List by alphabetical order
      if (contactsList != null) {
        contactsList!.sort((a, b) {
          return a.fullname.toLowerCase().compareTo(b.fullname.toLowerCase());
        });
      }

      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }

  searchContacs(String keyword) {
    print('Search Contacts : $keyword');

    if (contactsList != null) {
      for (int i = 0; i < contactsList!.length; i++) {
        if (contactsList![i]
            .fullname
            .toLowerCase()
            .contains(keyword.toLowerCase())) {
          Contact cache = contactsList![i];
          contactsList!.remove(contactsList![i]);
          contactsList!.insert(0, cache);
        }
      }

      notifyListeners();
    }
  }
}
