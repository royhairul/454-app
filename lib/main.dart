import 'package:flutter/material.dart';
import 'package:upk_454_app/src/ui/screen/register_screen.dart';
import 'package:upk_454_app/src/ui/screen/login_screen.dart';
import 'package:upk_454_app/src/ui/screen/dashboard_screen.dart';
import 'package:upk_454_app/src/ui/screen/peminjaman_screen.dart';
import 'package:upk_454_app/src/ui/screen/jadwal_screen.dart';
import 'package:upk_454_app/src/ui/screen/tambah_peminjaman_screen.dart';
import 'package:upk_454_app/src/ui/screen/tambah_jadwal_screen.dart';
import 'package:upk_454_app/src/utils/theme.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      title: "454 App",
      home: LoginScreen(),
      routes: <String, WidgetBuilder> {
      '/register': (BuildContext context) => const RegisterScreen(),
      '/login': (BuildContext context) => LoginScreen(),
      '/dashboard': (BuildContext context) => DashboardScreen(),
      '/peminjaman': (BuildContext context) => PeminjamanScreen(),
      '/jadwal': (BuildContext context) => JadwalScreen(),
      '/user': (BuildContext context) => PeminjamanScreen(),
      },
      debugShowCheckedModeBanner: false
    );
  }
}