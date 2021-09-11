import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:node_app/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';
import 'home_screen.dart';
import 'homepage.dart';
import 'initialize_google_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StarterApp());
}

class StarterApp extends StatefulWidget {
  const StarterApp({Key? key}) : super(key: key);

  @override
  State<StarterApp> createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        //home: LoginWithPhoneScreen(),
        //InitializerWidget(),
        initialRoute: InitializeGoogleScreen.id,
        routes: {
          InitializeGoogleScreen.id: (context) => InitializeGoogleScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          HomePage.id: (context) => const HomePage(),
          HomeScreen.id: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
