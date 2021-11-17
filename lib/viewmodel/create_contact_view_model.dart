import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/services/firestore_service/contact_data_serivce.dart';

class CreateContactViewModel extends ChangeNotifier {
  var nameController = TextEditingController();
  late String userAvatarIndex;

  bool isLoading = false;

  doCreateContact() async {
    isLoading = true;
    notifyListeners();

    // for test
    var contact = Contact(fullname: "Contact 2", avatar: "2", id: "erwlj33hg");

    await ContactDataService.storeContact(contact).then((value) =>
        print("doCreateContact : storeContact response : " + value.toString()));

    isLoading = false;
    notifyListeners();
  }
}
