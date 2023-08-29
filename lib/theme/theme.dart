import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[200],
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.deepPurple[600],
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurple),
  dividerColor: Colors.deepPurple[300],
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.deepPurple,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Colors.deepPurple.withOpacity(0.5),
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  ),
  scaffoldBackgroundColor: Colors.blue[200],
  primaryColor: Colors.blue[600],
);
