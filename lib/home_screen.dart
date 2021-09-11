import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:node_app/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedinUser;
  dynamic idtoken, token;
  dynamic em;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      //print('User1 = ' + user.toString());

      if (user != null) {
        loggedinUser = user;
        idtoken = await loggedinUser!.getIdToken();
        //print('loggedinUser=' + loggedinUser.toString());
        setState(() {
          em = loggedinUser!.email;
          token = idtoken;
        });

        // print(loggedinUser!.email);

        //print(idtoken);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Your email address: ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      em.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  //Implement login functionality.
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                  _auth.signOut();
                  Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                },
                child: const Text(
                  'Log Out',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.lightBlueAccent,
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ));
  }
}
