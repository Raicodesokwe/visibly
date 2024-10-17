import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//screen size
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
//show toast
void showToast(String message) {
  Fluttertoast.showToast(
      msg: message, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey // location
      // timeInSecForIos: 1               // duration
      );
}
//validations
String? validatePassword(String? val) {
  if (val == null || val.isEmpty) {
    return 'Please enter your password';
  } else if (val.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null; // Return null if validation is successful
}
String? validateUserName(String? val) {
  if (val == null || val.isEmpty) {
    return 'Please enter your username';
  } else if (val.length < 3) {
    return 'Username must be at least 3 characters long';
  }
  return null; // Return null if validation is successful
}
String? validateEmail(String? val) {
    if (val == null || val.isEmpty) {
                        return 'Please enter your username or email';
                      }
                       // Define a regular expression for validating an email
  String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);

  // Check if the input matches the email format
  if (!regex.hasMatch(val)) {
    return 'Please enter a valid email address';
  }
                      return null; // Return null if validation is successful
}
//flutter secure storage
const FlutterSecureStorage secureStorage =  FlutterSecureStorage();

Future<void> storeKeys() async {
  // Storing the keys in secure storage
  await secureStorage.write(key: 'supabaseUrl', value: dotenv.env['PROJECT_URL']!);
  await secureStorage.write(key: 'apiKey', value: dotenv.env['API_KEY']!);
}

Future<void> initializeSupabase() async {
  // Retrieving the keys from secure storage
  String? supabaseUrl = await secureStorage.read(key: 'supabaseUrl');
  String? apiKey = await secureStorage.read(key: 'apiKey');

  if (supabaseUrl != null && apiKey != null) {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: apiKey,
    );
  } else {
    throw Exception('Supabase keys not found in secure storage');
  }
}