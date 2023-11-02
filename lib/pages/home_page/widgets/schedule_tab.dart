import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xic_roster/extension/datetime_extension.dart';

import '../../../constants/schedule.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    int day = date.weekday;
    if (day != 7) {
      day = day - 1;
    } else {
      day = 0;
    }
    return Center(
      child: CarouselSlider(
        items: Schedule.dayData.map(
          (e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      date.weekdayName(Schedule.dayData
                              .indexWhere((element) => element == e) +
                          1)!,
                      style:
                          const TextStyle(fontSize: 32, fontFamily: "Poppins"),
                    ),
                    ...List.generate(
                      e.length,
                      (index) => Text(
                        e[index],
                        style: const TextStyle(fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
          height: 300,
          initialPage: day,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
