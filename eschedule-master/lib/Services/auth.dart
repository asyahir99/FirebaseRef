import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mp_final_project/models/Users.dart';
import 'database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future registerWithEmailAndPassword(
      String email, String matricNumber, name, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      await DatabaseServices(uid: user.uid).updateUserData(
          matricNumber, name, "student", email, "Pelajar FSKSM");
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<FirebaseUser> signInWithUsernameAndPassword(
      String username, String password) async {
    try {
      String email = await DatabaseServices().getEmail(username);
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
    }
    return _auth.currentUser();
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
