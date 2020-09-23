import 'package:episode_testing/widgets/textfeild.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new task',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyTextField(label: 'Title'),
                       SizedBox(height:10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              label: 'Date',
                              icon: downwardIcon,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: Colors.blue,
                            child: Icon(Icons.calendar_today,color: Colors.white,))
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: MyTextField(
                        label: 'Start Time',
                        icon: downwardIcon,
                      )),
                      SizedBox(width: 10),
                      Expanded(
                        child: MyTextField(
                          label: 'End Time',
                          icon: downwardIcon,
                        ),
                      ),
                    ],
                  ),
        
                  MyTextField(
                    label: 'Description',
                    minLines: 3,
                    maxLines: 3,
                  ),
                  SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 0,
                          //textDirection: TextDirection.rtl,
                          spacing: 10.0,
                          children: <Widget>[
                            Chip(
                              label: Text("SPORT APP"),
                              backgroundColor: Colors.red,
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            Chip(
                              label: Text("MEDICAL APP"),
                            ),
                            Chip(
                              label: Text("RENT APP"),
                            ),
                            Chip(
                              label: Text("NOTES"),
                            ),
                            Chip(
                              label: Text("GAMING PLATFORM APP"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    Container(
                      height: 50,
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}