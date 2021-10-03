import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strive_benefits/ui/dashboard.dart';
import 'package:strive_benefits/utils/app_constant.dart';

import 'model/provider/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Screens>(
      create: (context) => Screens(),
      child: MaterialApp(
        debugShowCheckedModeBanner: AppConstant.debugMode,
        title: AppConstant.appTitle,
        theme: ThemeData(
          primarySwatch: AppConstant.primarySwatch,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
