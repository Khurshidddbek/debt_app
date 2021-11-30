import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qarz_app/model/debt_model.dart';
import 'package:qarz_app/services/prefs_service.dart';

class DebtService {
  static final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  static Future storeDebt(Debt debt) async {
    var uid = await Prefs.loadUserId();
    print("storeDebt :user.uid = $uid");
    print("storeDebt :contact.data = ${debt.toString()}");

    return collection.doc(uid).collection('debtList').add(debt.toJson());
  }

  static Future<List<Debt>?> loadDebtList() async {
    List<Debt> debtList = [];
    String uid = await Prefs.loadUserId();

    var querySnapshot = await collection.doc(uid).collection("debtList").get();

    querySnapshot.docs.forEach((result) {
      debtList.add(Debt.fromJson(result.data()));
    });

    return debtList;
  }
}
