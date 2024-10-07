import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
//supabase
// It's handy to then extract the Supabase client in a variable for later uses
final supabase = Supabase.instance.client;
