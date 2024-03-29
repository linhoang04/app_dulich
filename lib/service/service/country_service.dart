import 'package:cloud_firestore/cloud_firestore.dart';

class CountryService {
  //get instance of auth and firebase
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each individual user: đi qua từng người dùng cá nhân
        final user = doc.data();
        return user;
      }).toList();
    });
  }
}
