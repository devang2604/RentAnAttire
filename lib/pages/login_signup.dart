import 'package:flutter/material.dart';
import 'package:loginpage/packages/flutter_login/flutter_login.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginpage/services/auth.dart';
import 'package:loginpage/navigation.dart';

class LoginScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        authButtonPadding: const EdgeInsets.symmetric(vertical: 20),
        pageColorLight: Colors.white70,
        primaryColor: Colors.black,
        cardTheme: const CardTheme(
          color: Colors.black45,
        ),
        accentColor:const  Color.fromARGB(255, 154, 150, 150),
        pageColorDark: Colors.white70,
        logoWidth: 1,
      ),
      logo: 'assets/logo.png',
      onLogin: _auth.signInWithEmailAndPassword,
      onSignup: _auth.registerWithEmailAndPassword,
      // loginProviders: [
      //   LoginProvider(
      //     icon: FontAwesomeIcons.google,
      //     callback: _auth.signInWithGoogle,
      //   ),
      //   LoginProvider(
      //     icon: FontAwesomeIcons.instagram,
      //     callback: _auth.signInWithGoogle,
      //   ),
      // ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>const  Navigation(),
        ));
      },
      onRecoverPassword: _auth.recoverPassword,
      // footer: "Designed and Developed by Anas Ansari and UI-updates by Devang Shukla",
      messages: LoginMessages(
        recoverPasswordDescription:
            'Enter your email to receive a link to reset your password',
      ),
    );
  }
}
