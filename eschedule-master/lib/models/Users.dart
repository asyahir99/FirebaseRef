class Users {
  String uid;
  Users({this.uid});
}

class UserData {
  String name;
  String category;
  String matricNumber;
  String email;
  String description;

  UserData(
      {this.name,
      this.category,
      this.matricNumber,
      this.email,
      this.description});

  factory UserData.fromDatabase(Map<String, dynamic> data) {
    return UserData(
        name: data['name'],
        category: data['category'],
        matricNumber: data['matricNumber'],
        email: data['email'],
        description: data['description']);
  }

  Map<String, dynamic> toDatabase() {
    return {
      'name': name,
      'category': category,
      'matricNumber': matricNumber,
      'email': email,
      'description': description
    };
  }

  String getMail() {
    return email;
  }

  String getMatric() {
    return matricNumber;
  }
}
