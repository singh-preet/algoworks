import 'package:flutter/material.dart';
import 'package:mainfreight/facebook.dart';
import 'package:mainfreight/google.dart';
import 'package:mainfreight/signin.dart';
import 'package:mainfreight/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final name;
  Home({this.name});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences prefs;
  Future pref() async{
    prefs= await SharedPreferences.getInstance();
  }
  @override
  void initState() {
    pref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Text(name!=null?'Logged in as: $name':'Logged in as: ${prefs.getBool('login')}'),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                  child: Text('Sign Out'),
                  onPressed: () {
                    prefs.setBool('login', false);
                    if(gUser==true){
                      handleSignOut().whenComplete(
                            () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            )),
                      );
                    }
                    else if(fbUser==true){
                      facebookLogout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                    }
                    else{
                      Navigator.pushReplacement(context,  MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));

                    }

                  })
            ],
          ),
        ),
      ),
    );
  }
}
