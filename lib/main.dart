import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunil_bio/components/colors.dart';
import 'package:sunil_bio/components/navigation_service.dart';
import 'package:sunil_bio/screens/authentication_screens/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //await dotenv.load(fileName: ".env");

  // String supabase = dotenv.env["SUPABASE_URL"]!;
  // String key = dotenv.env["SUPABASE_KEY"]!;
  await Supabase.initialize(
    url: "https://bllpxcosgwzilbksqnub.supabase.co",
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJsbHB4Y29zZ3d6aWxia3NxbnViIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk2NTcwMzEsImV4cCI6MjAwNTIzMzAzMX0.mSLVjSKHTMscceTUK01jZZCtA4VzCSnMNzQ99cmH6Mk'
  );


  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[NavigationService.routeObserver],
        navigatorKey: NavigationService.navigatorKey,
      themeMode: ThemeMode.light,
      theme: _buildTheme(),
      title: _title,
      home: LoginPage(),
    );
  }
}

ThemeData _buildTheme() {
  final baseTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: CustomColors.primarySwatchColor,
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );
  return baseTheme.copyWith(
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}









