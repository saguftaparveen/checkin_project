import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'home.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// googleSignIn() async {
//   GoogleSignInAccount? googleSignInAccount = await googlesignin.signIn();

//   if (googleSignInAccount != null) {
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//       idToken: googleSignInAuthentication.idToken,
//       accessToken: googleSignInAuthentication.accessToken,
//     );
//     final UserCredential authResult =
//         await firebaseAuth.signInWithCredential(credential);
//     final User user = authResult.user!;
//     print(user.uid);
//     return Future.value(true);
//   }
// }

showErrDialog(BuildContext context, String err) {
  // to hide the keyboard, if it is still p
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
    builder: (context) => AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    ),
    context: context,
  );
}

signup(String email, String password, BuildContext context) async {
  try {
    UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    if (FirebaseAuth.instance.currentUser != null) {
      // wrong call in wrong place!
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
    return Future.value(user);
  }
  // catch (error) {
  //   switch (error) {
  //     case 'email-already-in-use':
  //       showErrDialog(context, "Email Already Exists");
  //       break;
  //     case 'ERROR_INVALID_EMAIL':
  //       showErrDialog(context, "Invalid Email Address");
  //       break;
  //     case 'ERROR_WEAK_PASSWORD':
  //       showErrDialog(context, "Please Choose a stronger password");
  //       break;
  //   }
  // }
  catch (e) {
    // print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to sign up with Email & Password'),
      ),
    );
  }
}

Future<User> signin(String email, String password, BuildContext context) async {
  try {
    UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    User? user = result.user;
    if (FirebaseAuth.instance.currentUser != null) {
      // wrong call in wrong place!
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }
    return Future.value(user);
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to sign in with Email & Password'),
      ),
    );
    return Future.value(null);
  }
}

Future<bool> signout() async {
  // if (googleSignIn()) {
  //   await googlesignin.signOut();
  // }
  await firebaseAuth.signOut();
  return Future.value(true);
}
