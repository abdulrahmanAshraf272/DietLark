import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../just_downloaded/name_gender/get_name_gender.dart';

class UserAccountOperations {
  //Important: by this functions i can both sign up new account and login.
  Future createNewAccountByGoogle(BuildContext context) async {
    try {
      EasyLoading.show(status: 'loading...');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the signed-in user
      final user = userCredential.user;

      // If the login was successful, set the user account and navigate to the home screen
      if (user != null) {
        EasyLoading.dismiss();
        HoldValues.USER_ACCOUNT = user.email ?? '';
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GetNameGendar()));
      }

      print('new account created.');

      // Return the UserCredential
      return userCredential;
    } catch (e) {
      EasyLoading.dismiss();
      // If an error occurred, show a snackbar with an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('حدث خطأ, حاول مرة اخرى'),
      ));

      // Return null to indicate that creating the account failed
      return null;
    }
  }

  Future loginByGoogle(BuildContext context) async {
    try {
      EasyLoading.show(status: 'loading...');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the signed-in user
      final user = userCredential.user;

      // If the login was successful, set the user account and navigate to the home screen
      if (user != null) {
        HoldValues.USER_ACCOUNT = user.email ?? '';
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        //Check if the account have name, if have name that means , it is login Operation-user have account before-
        //if the first name  = null , that means it is a sign up operation -creating new account-.
        if (snapshot.data()?[KEY_FIRST_NAME] != null) {
          //It is login operation.
          await DatabaseOperations().loginGetUserInfo();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          print('======== Login by google done sucsessfully');
        } else {
          //It is a Sign up operation.
          HoldValues.isSignUpOperation = true;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GetNameGendar()));
          print('======== Create new account by google done sucsessfully');
        }
      }
      EasyLoading.dismiss();

      print('new account created.');

      // Return the UserCredential
      return userCredential;
    } catch (e) {
      EasyLoading.dismiss();
      // If an error occurred, show a snackbar with an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('حدث خطأ, حاول مرة اخرى'),
      ));
      print('the google error is: $e');

      // Return null to indicate that creating the account failed
      return null;
    }
  }

  //This function to logout from current account
  Future logoutAccount() async {
    await FirebaseAuth.instance.signOut().then((value) {
      print('Signed out done.');
      //Navigate to the page i want here.
      HoldValues.firstTime = true;
    }).onError((error, stackTrace) {
      print('Signout failed error ${error.toString()}');
    });
  }

  Future createNewAccountByEmail(
      BuildContext context, String _email, String _password) async {
    if (_email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('ادخل البريد الإلكتروني'),
      ));
      return;
    } else if (_password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('ادخل كلمة السر'),
      ));
      return;
    }
    try {
      EasyLoading.show(status: 'loading...');
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.trim(), password: _password.trim());
      EasyLoading.dismiss();
      HoldValues.isSignUpOperation = true;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GetNameGendar()));

      print('new account created.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('كلمة سر ضعيفة'),
        ));
        EasyLoading.dismiss();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('لديك حساب بالفعل! انقر على تسجيل دخول'),
        ));
        EasyLoading.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginByEmail(
      BuildContext context, String _email, String _password) async {
    try {
      if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ادخل البريد الإلكتروني'),
        ));
        return;
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ادخل كلمة السر'),
        ));
        return;
      }
      EasyLoading.show(status: 'loading...');
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.trim(), password: _password.trim());
      final user = FirebaseAuth.instance.currentUser;

      //If the login done , then get user account name, and get all his Data.
      if (user != null) {
        HoldValues.USER_ACCOUNT = user.email ?? '';
        await DatabaseOperations().loginGetUserInfo();
        print(HoldValues.PREMIUM_ACCOUNT);
      }
      EasyLoading.dismiss();
      print('=== login sucsessfully done! ===');
      //Navigat to home screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('البريد الإلكتروني غير صحيح'),
        ));
        EasyLoading.dismiss();
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('كلمة سر غير صحيحة'),
        ));
        EasyLoading.dismiss();
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> loginWithFacebook(BuildContext context) async {
    try {
      EasyLoading.show(status: 'loading...');
      // Log in to Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if login was successful
      if (result.status == LoginStatus.success) {
        // Get the user's access token
        final AccessToken? accessToken = result.accessToken;

        // Authenticate with Firebase Authentication using the Facebook access token
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken!.token);
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          HoldValues.USER_ACCOUNT = user.email ?? '';
          final snapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          //Check if the account have name, if have name that means , it is login Operation-user have account before-
          //if the first name  = null , that means it is a sign up operation -creating new account-.
          if (snapshot.data()?[KEY_FIRST_NAME] != null) {
            //It is login operation.
            await DatabaseOperations().loginGetUserInfo();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else {
            //It is a Sign up operation.
            HoldValues.isSignUpOperation = true;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => GetNameGendar()));
          }
        }
        // Check if login was successful
        if (userCredential.user != null) {
          print('Login successful: ${userCredential.user!.uid}');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'حدث خطأ, يمكنك تسجيل الدخول من خلال جوجل او البريد الالكتروني.'),
          ));
          print('Login failed');
        }
      } else if (result.status == LoginStatus.cancelled) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'حدث خطأ, يمكنك تسجيل الدخول من خلال جوجل او البريد الالكتروني.'),
        ));
        print('Facebook login cancelled by user');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'حدث خطأ, يمكنك تسجيل الدخول من خلال جوجل او البريد الالكتروني.'),
        ));
        print('Facebook login failed');
      }
      EasyLoading.dismiss();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'حدث خطأ, يمكنك تسجيل الدخول من خلال جوجل او البريد الالكتروني.'),
      ));
      print('Error logging in with Facebook: $e');
      EasyLoading.dismiss();
    }
  }
}
