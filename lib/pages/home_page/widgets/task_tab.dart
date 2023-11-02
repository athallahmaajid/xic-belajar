import 'package:flutter/material.dart';
import 'package:witt/witt.dart';
import 'package:xic_roster/services/task_service.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({Key? key}) : super(key: key);

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TaskService.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    WRouter.pushNamed("/detail", arguments: {
                      "title": data[index].title,
                      "subject": data[index].subject,
                      "desc": data[index].desc,
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          data[index].subject,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins",
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data[index].desc,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
