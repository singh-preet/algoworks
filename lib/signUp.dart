import 'package:flutter/material.dart';
import 'package:mainfreight/forms.dart';
import 'package:mainfreight/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();

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
              height: MediaQuery.of(context).size.height / 1.9,
              width: double.maxFinite,
              child: SignUpForm(formKey: _formKey, name: name, email: email, password: password,scaffoldKey: _scaffoldKey),
            ),
          ),
          Positioned(
            right: 15,
            bottom: MediaQuery.of(context).size.height / 2.1,
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
              onPressed: signUp,
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }

  Future saveCredentials (name, email, password)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('name',name);
    prefs.setString('email',email);
    prefs.setString('password',password);
    prefs.setBool('login', true);
    print(prefs.getString('password'));
  }


   signUp() {
    if (_formKey.currentState.validate()) {
      print('waheguru');
      saveCredentials(name.text, email.text, password.text).whenComplete((){

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              name: name.text,
            ),
          ),
        );
      });

    }
  }
}
