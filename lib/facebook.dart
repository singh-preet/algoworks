import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:mainfreight/style.dart';

Map userProfile;
final facebookLogin = FacebookLogin();
Future logIn() async{
  final FacebookLoginResult result = await facebookLogin.logIn(['email']);
  switch(result.status){
    case FacebookLoginStatus.loggedIn:
      final token = result.accessToken.token;
      final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
      final profile = JSON.jsonDecode(graphResponse.body);
      userProfile = profile;
      name=profile['name'];
      imageUrl=profile['picture']['data']['url'];
      email=profile['email'];
      fbUser=true;
      isLoggedIn=true;
      print(userProfile);
      print(isLoggedIn);
      return 1;
      break;
    case FacebookLoginStatus.error:
      print(2);
      print(isLoggedIn);
      isLoggedIn=false;
      return 2;
      break;
    case FacebookLoginStatus.cancelledByUser:
      print(3);
      isLoggedIn=false;
      return 3;
      break;
  }
}

facebookLogout() async {
  facebookLogin.logOut().whenComplete((){
    print('You have been signed out');

  });
}