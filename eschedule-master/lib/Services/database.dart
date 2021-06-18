import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mp_final_project/models/Users.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});
  List<UserData> users = [];
  final CollectionReference user = Firestore.instance.collection("Users");

  Future<void> updateUserData(String matricNumber, String name, String category,
      String email, String description) async {
    return await user.document(uid).setData({
      'matricNumber': matricNumber,
      'name': name,
      'category': category,
      'email': email,
      'description': description
    });
  }

  Future<String> getEmail(String username) async {
    String email = "";
    QuerySnapshot snapshot = await user.getDocuments();
    snapshot.documents.forEach((document) {
      UserData userdata = UserData.fromDatabase(document.data);
      users.add(userdata);
    });
    for (int i = 0; i < users.length; i++) {
      if (username == users[i].getMatric()) {
        email = users[i].getMail();
      }
    }
    return email;
  }

  Future<String> getUsername() async {
    final DocumentSnapshot doc = await user.document(uid).get();
    String username = doc.data['matricNumber'];
    return username;
  }

  Future<DocumentSnapshot> getUserData() async {
    final DocumentSnapshot doc = await user.document(uid).get();
    return doc;
  }

  Future<String> getCategory() async {
    final DocumentSnapshot doc = await user.document(uid).get();
    String category = doc.data['category'];
    return category;
  }
}
