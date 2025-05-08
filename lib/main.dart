import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/user_list_page.dart';
import 'pages/user_form_page.dart';

void main() {
  runApp(const UserMobileApp());
}

class UserMobileApp extends StatefulWidget {
  const UserMobileApp({super.key});

  @override
  State<UserMobileApp> createState() => _UserMobileAppState();
}

class _UserMobileAppState extends State<UserMobileApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  // Carrega o tema salvo
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  // Troca e salva o tema
  Future<void> _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = _themeMode == ThemeMode.dark;
    setState(() {
      _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    });
    await prefs.setBool('isDarkTheme', !isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => UserListPage(onToggleTheme: _toggleTheme),
        '/create': (context) => UserFormPage(
              onSave: () {
                Navigator.pop(context, true);
              },
            ),
      },
    );
  }
}
