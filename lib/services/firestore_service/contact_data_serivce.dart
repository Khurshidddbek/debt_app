import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/services/prefs_service.dart';

class ContactDataService {
  static final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  static Future storeContact(Contact contact) async {
    var uid = await Prefs.loadUserId();
    print("storeContact :user.uid = $uid");
    print("storeContact :contact.data = ${contact.toString()}");

    return collection.doc(uid).collection('contacts').add(contact.toJson());
  }

  static Future<List<Contact>?> loadContactsList() async {
    List<Contact> contacts = [];
    String uid = await Prefs.loadUserId();

    var querySnapshot = await collection.doc(uid).collection("contacts").get();

    querySnapshot.docs.forEach((result) {
      contacts.add(Contact.fromJson(result.data()));
    });

    return contacts;
  }
}

// _actionRemovePost(Post post) async{
//     var result = await Utils.dialogCommon(context, "Insta Clone", "Do you want to remove this post?", false);
//     if(result != null && result){
//       setState(() {
//         isLoading = true;
//       });
//       DataService.removePost(post).then((value) => {
//         _apiLoadFeeds(),
//       });
//     }
//   }