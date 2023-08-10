import 'package:blocstate/core/utils/theme.dart';
import 'package:blocstate/state_management/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      theme:Themes().lightTheme,
      darkTheme:Themes().lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
