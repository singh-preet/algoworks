import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mainfreight/style.dart';



final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleGoogleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  if(googleUser!=null){
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print(user.email);
    print("signed in " + user.displayName);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoUrl;
    userId=user.uid;
    gUser=true;
    isLoggedIn=true;
    return user;
  }
  else{
    isLoggedIn=false;
    return null;
  }
}

Future handleSignOut() async {
   imageUrl="http://13.235.169.150//mainfreight//uploads//images//";
  _googleSignIn.signOut().whenComplete(() => print('You have been signed out'));
  name=null;
}
