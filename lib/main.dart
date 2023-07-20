import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff081b25)
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if(snapshot.hasError)
          {
            print("Error");
          }
         if(snapshot.connectionState==ConnectionState.done)
         {
          return Home();
         }
         return CircularProgressIndicator();
        },
      ),
    );
  }
}


