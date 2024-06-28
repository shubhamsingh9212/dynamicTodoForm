import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form/common_widgets/custom_loader.dart';
import 'package:get/get.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  void addData(
    RxList<Map<String, dynamic>> data,
  ) async {
    try {
      loader();
      for (int i = 0; i < data.length; i++) {
        bool isExist = false;
        String userName = data[i]["user_name"];
        log(userName);
        isExist = await isUserExists(userName);
        if (isExist) {
          db
              .collection('userData')
              .doc(userName)
              .set(data[i], SetOptions(merge: true));
        } else {
          db.collection('userData').doc(userName).set(data[i]);
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
    }
  }

  Future<List<String>> getUserList() async {
    try {
      loader();
      CollectionReference<Map<String, dynamic>> collection =
          db.collection('userData');
      QuerySnapshot<Map<String, dynamic>> documents = await collection.get();
      List<String> userList = documents.docs.map((e) => e.id).toList();
      log(userList.toString());
      return userList;
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
    }
    return [];
  }

  Future<Map<String, dynamic>?> getUserData({
    required String documentId,
  }) async {
    try {
      DocumentReference documentReference =
          db.collection('userData').doc(documentId);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>?;
      } else {
        print("Document does not exist.");
        return null;
      }
    } catch (e) {
      print("Error getting document data: $e");
      return null;
    }
  }

  Future<bool> isUserExists(String userName) async {
    try {
      DocumentReference documentReference =
          db.collection('userData').doc(userName);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      log(documentSnapshot.exists.toString());
      return documentSnapshot.exists;
    } catch (e) {
      log("Error : $e");
      return false;
    }
  }
}
