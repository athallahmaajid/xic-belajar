import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:witt/witt.dart';
import 'package:xic_roster/pages/routes.dart';

import '../../constants/asset_path.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = WProvider.of<FlutterSecureStorage>(context);
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AssetPath.background),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Kamu nyusun roster kapan?",
                  style: TextStyle(
                      color: Colors.white, fontSize: 32, fontFamily: "Poppins"),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await storage.write(
                          key: "arrange_books_time", value: "morning");
                      WRouter.pushReplacementNamed(Routes.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Pagi",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      storage.write(
                          key: "arrange_books_time", value: "morning");
                      WRouter.pushReplacementNamed(Routes.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Malem",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
