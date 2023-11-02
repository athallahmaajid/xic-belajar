import 'package:flutter/material.dart';

import '../../constants/asset_path.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String subject;
  final String desc;
  const DetailPage(
      {Key? key,
      required this.title,
      required this.subject,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AssetPath.background),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(subject),
                SizedBox(height: 32),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
