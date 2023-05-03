import 'package:flutter/material.dart';
import 'package:polaris/core/ui/app_theme.dart';

class PolarisApp extends StatelessWidget {
  const PolarisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      themeMode: AppTheme.mode,
      debugShowCheckedModeBanner: false,
      title: "Polaris",
      home: const Scaffold(
        body: Center(
          child: Text("Polaris"),
        ),
      ),
    );
  }
}
