import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mainfreight/facebook.dart';
import 'package:mainfreight/google.dart';
import 'package:mainfreight/home.dart';
import 'package:mainfreight/signUp.dart';
import 'package:mainfreight/signin.dart';
import 'package:mainfreight/style.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.name,
    @required this.email,
    @required this.password,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Text(
              "Please Sign Up",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
              ),
//                        onChanged: (value){
//                          setState(() {
//                            userSave.name=value;
//                          });
//                        },
              validator: (value) {
                return value.isEmpty
                    ? 'This field cannot be empty'
                    : null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: "Email Address"),
              validator: (value) {
                return value.isEmpty
                    ? 'This field cannot be empty'
                    : null;
              },
              keyboardType: TextInputType.emailAddress,
//                        onChanged: (value){
//                          setState(() {
//                            userSave.email=value;
//                          });
//                        },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              validator: (value) {
                return value.isEmpty
                    ? 'This field cannot be empty'
                    : null;
              },
//                        onChanged: (value){
//                          setState(() {
//                            userSave.password=value;
//                          });
//                        },
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(12),
            child: FlatButton(
              child: Text(
                'Have an account?',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () =>
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>SignIn(),
                  ),),
            ),
          )
        ],
      ),
    );
  }
}



class LogInForm extends StatelessWidget {
  const LogInForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.email,
    @required this.password,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _formKey = formKey, _scaffoldKey = scaffoldKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Text(
              "Please Sign In",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
              controller: email,
              validator: (value) {
                return value.isEmpty
                    ? 'This field cannot be empty'
                    : null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
              validator: (value) {
                return value.isEmpty
                    ? 'This field cannot be empty'
                    : null;
              },
              obscureText: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print(isLoggedIn);
                  handleGoogleSignIn().whenComplete(() {
                    isLoggedIn
                        ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ))
                        : _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content:
                        Text('Login cancelled by user'),
                        backgroundColor: red,
                      ),
                    );
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  logIn().whenComplete(() {
                    isLoggedIn
                        ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    )
                        : _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content:
                        Text('Login cancelled by user'),
                        backgroundColor: red,
                      ),
                    );
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(12),
            child: FlatButton(
                child: Text(
                  'New User?',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
