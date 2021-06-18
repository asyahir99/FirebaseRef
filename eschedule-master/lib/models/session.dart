class Session {
  String login_name;
  String session_id;
  String full_name;
  String desc;

  Session({this.login_name, this.desc, this.full_name, this.session_id});

  factory Session.fromJson(Map<String, dynamic> data) {
    return Session(
        login_name: data['login_name'],
        desc: data['desc'],
        full_name: data['full_name'],
        session_id: data['session_id']);
  }

  String getSessionID() {
    return session_id;
  }
}
