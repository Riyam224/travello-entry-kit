// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travello/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  // todo
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      // todo do the impl with firestore to save auth data and store it
      //  in collections and if there is another servive use it
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> deleteData({required String path, required String documentId}) {
    var data = firestore.collection(path).doc(documentId);
    return data.delete();
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) {
    var data = firestore.collection(path).doc(documentId).get();
    return data.then((value) => value.data() as Map<String, dynamic>);
  }
}
