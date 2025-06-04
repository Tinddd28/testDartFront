import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/screens/application_page.dart';
import 'package:flutter_application_1/screens/file_activity_page.dart';
import 'package:flutter_application_1/screens/network_activity_page.dart';
import 'package:flutter_application_1/viewmodel/application_viewmodel.dart';
import 'package:flutter_application_1/viewmodel/file_activity_viewmodel.dart';
import 'package:flutter_application_1/viewmodel/network_activity_viewmodel.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApplicationsViewModel()),
        ChangeNotifierProvider(create: (_) => FileActivityViewModel()),
        ChangeNotifierProvider(create: (_) => NetworkActivityViewModel()),
      ],
      child: MaterialApp(
        title: 'Client Monitoring App',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Color(0xFFF5F6FA),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFE3E3E3),
            foregroundColor: Colors.black,
          ),
          cardColor: Color(0xFFFFFFFF),
          colorScheme: ColorScheme.light(
            primary: Colors.green,
            secondary: Colors.tealAccent,
            background: Color(0xFFF5F6FA),
            surface: Color(0xFFFFFFFF),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/applications': (context) => ApplicationsPage(),
          '/file-activities': (context) => FileActivityPage(),
          '/network-activities': (context) => NetworkActivityPage(),
          '/auth': (context) => AuthPage(),
        },
      ),
    );
  }
}