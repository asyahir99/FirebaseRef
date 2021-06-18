import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mp_final_project/Services/auth.dart';
import 'package:mp_final_project/components/already_have_an_account.dart';
import 'package:mp_final_project/components/rounded_button.dart';
import 'package:mp_final_project/components/rounded_input_field.dart';
import 'package:mp_final_project/components/rounded_password_field.dart';
import 'package:mp_final_project/screens/Log_in/components/background.dart';
import 'package:mp_final_project/screens/Sign_up/sign_up_screen.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthServices _auth = AuthServices();
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icon/student.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
              hintText: "Username",
              onChanged: (value) {
                username = value;
              }),
          RoundedPasswordField(
            onChanged: (value) {
              password = value;
            },
          ),
          SizedBox(height: size.height * 0.01),
          RoundedButton(
            text: "Login",
            press: () async {
              dynamic result =
                  await _auth.signInWithUsernameAndPassword(username, password);
              print(result.uid);
              if (result == null) {
                print("error sign in");
              }
            },
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccount(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
