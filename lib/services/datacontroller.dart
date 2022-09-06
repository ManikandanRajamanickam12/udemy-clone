import 'package:cloud_firestore/cloud_firestore.dart';

class Datacontroller {
  static Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  static Future querytData(String queryString) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("featured")
        .where("title", isGreaterThanOrEqualTo: queryString)
        .get();
    return snapshot.docs;
  }
}
