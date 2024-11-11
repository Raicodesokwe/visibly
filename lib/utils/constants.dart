
import 'package:flutter/material.dart';
//Colors
class AppColors {
  static const appDark = Color(0xff292D32);
  static const appGreen = Color(0xFF64FF6A);
}
//images and icons
const String logoImage='assets/images/visibly-logo.svg';
const String searchIcon='assets/images/search-icon.svg';
const String scanIcon='assets/images/scan-icon.svg';
const String accreditCheckIcon='assets/images/accredit-check.svg';
const String certificateIcon='assets/images/certificate-icon.svg';
const String approvedIcon='assets/images/approved-icon.svg';
//fonts
const String clashDisplay='ClashDisplay';

//firebase auth error messages
const String weakPassword='weak-password';
const String emailAlreadyInUse='email-already-in-use';
const String userNotFound='user-not-found';
const String wrongPassword='wrong-password';
//general error message
const String somethingWentWrong='Something went wrong';
//Request headers
Map<String, String> get headers {

  return {
    "Content-Type": "application/json",
  };
}

//Errors
const noInternet = 100;
const apiError = 101;
const unknownError = 103;
const emptyFieldError = 104;
const unauthorizedError = 401;

//success and failure codes
const successCode = 200;
const successCreated = 201;
const successCodes = [200, 201, 202, 204];
const failureCodes = [400, 401, 402, 404, 500, 503];
//supabase chat table fields
const String avatarUrl='avatar_url';
const String username='username';
const String unknown='Unknown';
const String message='message';
const String createdAt='created_at';
const String chat='chat';
const String id='id';
const String userId='user_id';
const String channel='channel';