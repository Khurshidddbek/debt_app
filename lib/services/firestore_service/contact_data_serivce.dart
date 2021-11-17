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
}

// static Future<Post> storePost(Post post) async {
//     User me = await loadUser();
//     post.uid = me.uid;
//     post.fullname = me.fullname;
//     post.img_user = me.img_url;
//     post.date = Utils.currentDate();

//     String postId = _firestore.collection(folder_users).document(me.uid).collection(folder_posts).document().documentID;
//     post.id = postId;

//     await _firestore.collection(folder_users).document(me.uid).collection(folder_posts).document(postId).setData(post.toJson());
//     return post;
//   }