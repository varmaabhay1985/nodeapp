import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:node_app/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class InitializeGoogleScreen extends StatefulWidget {
  static String id = 'initialize_google_screen';
  const InitializeGoogleScreen({Key? key}) : super(key: key);

  @override
  _InitializeGoogleScreenState createState() => _InitializeGoogleScreenState();
}

class _InitializeGoogleScreenState extends State<InitializeGoogleScreen> {
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();

    //isLoading = false;
  }

  void getUser() async {
    setState(() {
      isLoading = true;
    });
    _user = await _auth.currentUser;
    print('User' + _user.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? const WelcomeScreen()
            : const HomeScreen();
  }
}
