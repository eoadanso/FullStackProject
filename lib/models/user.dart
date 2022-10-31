import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String password;
  final String bio;
  final String uid;
  final String photoUrl;
  final List followers;
  final List following;

  const User({required this.username, required this.email,
      required this.password, required this.bio, required this.uid,
      required this.photoUrl, required this.followers, required this.following});

  Map<String, dynamic> toJson() =>
      {
        "username": username,
        "email": email,
        "photoUrl": photoUrl,
        "uid": uid,
        "bio": bio,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot["username"],
      email: snapshot["username"],
      password: snapshot["username"],
      photoUrl: snapshot["username"],
      uid: snapshot["username"],
      bio: snapshot["username"],
      followers: snapshot["username"],
      following: snapshot["username"],
    );
  }
}
