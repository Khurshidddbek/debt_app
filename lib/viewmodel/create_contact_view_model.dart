import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/services/firestore_service/contact_data_serivce.dart';

class CreateContactViewModel extends ChangeNotifier {
  var nameController = TextEditingController();
  var nameControllerValidator = false;
  var userAvatarIndex = 0;

  bool isLoading = false;

  doCreateContact() async {
    isLoading = true;
    notifyListeners();

    if (nameController.text.isEmpty)
      nameControllerValidator = true;
    else {
      // Create Contact
      await ContactDataService.storeContact(Contact(
          fullname: nameController.text,
          avatar: userAvatarIndex.toString(),
          id: DateTime.now().millisecondsSinceEpoch.toString()));

      isLoading = false;
      notifyListeners();

      // Navigator => ContacsPage and refresh Contacts list
    }

    // for test
    // var contact = Contact(fullname: "Contact 2", avatar: "2", id: "erwlj33hg");

    // await ContactDataService.storeContact(contact).then((value) =>
    //     print("doCreateContact : storeContact response : " + value.toString()));

    // isLoading = false;
    // notifyListeners();
  }

  userAvatarSelection(int index) {
    userAvatarIndex = index;
    notifyListeners();
  }
}
