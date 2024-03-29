import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //get current user

  User? getCurrenUser() {
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailAndPass(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //save user in fireStore
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        },
      );
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailAndPass(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //save
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        },
      );
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  //logout
  void logout() {
    _auth.signOut();
  }
}
