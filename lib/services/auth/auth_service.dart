import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //todo: get instance of firebase Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //todo: get current usr
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //todo: sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //todo: sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //todo: sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
