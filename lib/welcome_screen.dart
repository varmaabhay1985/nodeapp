import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';

import 'google_sign_in.dart';
import 'home_screen.dart';
import 'homepage.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //final _auth = FirebaseAuth.instance;
  bool isLoading = false;

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser().then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    });
  }*/

  /*Future<User?> getUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Welcome'),
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    "Please Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        await provider.googleLogin();
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        print(e);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e.message!)));
                      }
                    },
                    child: const Text(
                      "Login with Google",
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFFC912),
                        elevation: 50,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: const Text(
                      "Create An Account",
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        elevation: 50,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          );
  }
}
