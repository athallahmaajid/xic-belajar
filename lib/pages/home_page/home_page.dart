import 'package:flutter/material.dart';
import 'package:xic_roster/pages/home_page/widgets/schedule_tab.dart';
import 'package:xic_roster/pages/home_page/widgets/task_tab.dart';

import '../../constants/asset_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("XI C"),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Roster",
              ),
              Tab(text: "Tugas")
            ],
          ),
        ),
        body: const Stack(
          children: [
            Image(
              image: AssetImage(AssetPath.background),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            TabBarView(
              children: [
                ScheduleTab(),
                TaskTab(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
