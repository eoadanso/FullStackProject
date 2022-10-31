import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proper_project/models/user.dart' as model;
import 'package:proper_project/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  // sign up user function
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // StorageMethod call
        String photoUrl = await StorageMethod()
            .uploadImageToStorage("profilePics", file, false);

        // Add user to our database
        model.User user = model.User(
          username: username,
          photoUrl: photoUrl,
          password: password,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());
        res = "Success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

// function for logging in a user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        res = "Success";
      }else{
        res = "Please enter all the fields";
      }
    }catch(e){
      res = e.toString();
    }
    return res;
  }
}
