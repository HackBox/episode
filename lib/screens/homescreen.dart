import 'package:episode_testing/screens/calenderPage.dart';
import 'package:episode_testing/screens/createTaskPage.dart';
import 'package:episode_testing/themes/colors.dart';
import 'package:episode_testing/widgets/taskcards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
        color: LightColors.kDarkBlue,
        fontSize: 19.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  static CircleAvatar createIcon() {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.add,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        subheading('My Tasks'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: ListView(
                        children: [
                          Row(
                            children: <Widget>[
                              TaskCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.55,
                                title: 'Data Mining',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              TaskCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Data Warehousing',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              TaskCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.45,
                                title: 'Machine learning',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              TaskCard(
                                cardColor: LightColors.kBlue,
                                loadingPercent: 0.9,
                                title: 'Data Science',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              TaskCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.55,
                                title: 'Data Mining',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              TaskCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Data Warehousing',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              TaskCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.45,
                                title: 'Machine learning',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              TaskCard(
                                cardColor: LightColors.kBlue,
                                loadingPercent: 0.9,
                                title: 'Data Science',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalenderPage()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Calender',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateTask()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create Task',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 28,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
