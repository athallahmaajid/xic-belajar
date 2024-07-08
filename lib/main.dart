import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:witt/witt.dart';
import 'package:xic_roster/pages/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    WMultiProvider(
      providers: [
        WProvider(service: (context) => const FlutterSecureStorage()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF001220),
        secondaryHeaderColor: const Color(0xFFfbae3c),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: WRouter.navigatorKey,
      onGenerateRoute: (settings) => WRouter.onGenerateRoute(
        settings: settings,
        pages: [
          ...Routes.routes(),
        ],
      ),
    );
  }
}
