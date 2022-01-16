import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

//Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

//Sign In authentication
  Future<bool> signIn({String email, String password}) async {
    try {
      UserCredential userCred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCred.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      print("[FirebaseService] inside siginIn Exception is : $e");
      return false;
    }
  }

//SIgnup and create users credentials in firestore
  Future<bool> signUp(
      {String email,
      String password,
      String dob,
      String phone,
      String userName}) async {
    try {
      UserCredential userCred = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCred.user != null) {
        await _firebaseFirestore
            .collection("userData")
            .doc(userCred.user.email)
            .set({
          "email": userCred.user.email,
          "phone": phone,
          "dob": dob,
          "userName": userName,
          "avatar": "https://goog.com"
        });
        //return true;
      } else {
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
       print("[FirebaseService] inside siginUp Exception is : $e");
      return false;
    }
  }

// Reset / Forgot password
  Future<String> resetPassword({String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

//Phone auth
//     Future createUserWithPhone(String phone, BuildContext context) async {
//     _firebaseAuth.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: Duration(seconds: 0),
//         verificationCompleted: (AuthCredential authCredential) {
//           _firebaseAuth.signInWithCredential(authCredential).then((AuthResult result){
//             Navigator.of(context).pushReplacementNamed('/home');
//           }).catchError((e) {
//             return "error";
//           });
//         },
//         verificationFailed: (AuthException exception) {
//           return "error";
//         },
//         codeSent: (String verificationId, [int forceResendingToken]) {
//           final _codeController = TextEditingController();
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (context) => AlertDialog(
//               title: Text("Enter Verification Code From Text Message"),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[TextField(controller: _codeController)],
//               ),
//               actions: <Widget>[
//                 FlatButton(
//                   child: Text("submit"),
//                   textColor: Colors.white,
//                   color: Colors.green,
//                   onPressed: () {
//                     var _credential = PhoneAuthProvider.getCredential(verificationId: verificationId,
//                         smsCode: _codeController.text.trim());
//                     _firebaseAuth.signInWithCredential(_credential).then((AuthResult result){
//                       Navigator.of(context).pushReplacementNamed('/home');
//                     }).catchError((e) {
//                       return "error";
//                     });
//                   },
//                 )
//               ],
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           verificationId = verificationId;
//         });
//   }
// }
}
