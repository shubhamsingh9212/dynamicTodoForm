import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<void> addData(
    List<Map<String, dynamic>> data,
  ) async {
    for (int i = 0; i < data.length; i++) {
      bool isExist = false;
      String userName = data[i]["user_name"];
      log(userName);
      isExist = await isUserExists(userName);
      if (isExist) {
        await db
            .collection('userData')
            .doc(userName)
            .set(data[i], SetOptions(merge: true));
      } else {
        await db.collection('userData').doc(userName).set(data[i]);
      }
    }
  }

  Future<List<String>> getUserList() async {
    CollectionReference<Map<String, dynamic>> collection =
        db.collection('userData');
    QuerySnapshot<Map<String, dynamic>> documents = await collection.get();
    List<String> userList = documents.docs.map((e) => e.id).toList();
    log(userList.toString());
    return userList;
  }

  Future<Map<String, dynamic>?> getUserData({
    required String documentId,
  }) async {
    DocumentReference documentReference =
        db.collection('userData').doc(documentId);

    DocumentSnapshot documentSnapshot = await documentReference.get();

    if (documentSnapshot.exists) {
      return documentSnapshot.data() as Map<String, dynamic>?;
    } else {
      print("Document does not exist.");
      return null;
    }
  }

  Future<bool> isUserExists(String userName) async {
    DocumentReference documentReference =
        db.collection('userData').doc(userName);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    log(documentSnapshot.exists.toString());
    return documentSnapshot.exists;
  }
}
