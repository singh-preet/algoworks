import 'package:flutter/material.dart';
import 'package:mainfreight/forms.dart';
import 'package:mainfreight/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/signin.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2.2,
              width: double.maxFinite,
              child: LogInForm(
                  formKey: _formKey,
                  email: email,
                  password: password,
                  scaffoldKey: _scaffoldKey),
            ),
          ),
          Positioned(
            right: 15,
            bottom: MediaQuery.of(context).size.height / 2.5,
            child: MaterialButton(
              child: Container(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35,
                ),
                height: 70,
              ),
              shape: CircleBorder(),
              color: Colors.pink[100],
              onPressed: logIn,
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }
  Future logIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('password'));

    if (_formKey.currentState.validate() &&
        email.text == prefs.getString('email') &&
        password.text == prefs.getString('password')) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            name: prefs.getString('name'),
          ),
        ),
      );
    }

  }
}
