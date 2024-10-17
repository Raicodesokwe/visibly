import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibly/firebase_options.dart';
import 'package:visibly/services/auth_service.dart';
import 'package:visibly/utils/common_functions.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
     await dotenv.load(fileName: ".env");
       // Store the keys in secure storage
  await storeKeys();
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //initialize firebase
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // Initialize Supabase
  await initializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visibly Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         textTheme: GoogleFonts.figtreeTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: AuthService.checkAuth(),
    );
  }

  
}

