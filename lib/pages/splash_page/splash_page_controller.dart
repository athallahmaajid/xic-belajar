import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xic_roster/pages/routes.dart';
import 'package:witt/witt.dart';

class SplashPageController {
  final BuildContext context;

  SplashPageController({required this.context}) {
    Future.delayed(const Duration(seconds: 1), initializeAsync);
  }

  Future<void> initializeAsync() async {
    final storage = WProvider.of<FlutterSecureStorage>(context);
    if (await storage.containsKey(key: "arrange_books_time")) {
      WRouter.pushReplacementNamed(Routes.homeRoute);
      return;
    }
    WRouter.pushReplacementNamed(Routes.choiceRoute);
  }
}
