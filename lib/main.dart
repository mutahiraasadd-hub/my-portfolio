import 'package:flutter/material.dart';
import 'package:m_portfolio/core/router/app_router.dart';
import 'package:m_portfolio/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Mutahira Asad's Portfolio",
      // --- CHANGE IS HERE ---
      theme: AppTheme.lightTheme, 
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}