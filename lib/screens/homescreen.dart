import 'dart:async';
import 'package:flutter/material.dart';
import 'package:episode/Models/todo.dart';
import 'package:episode/Utils/database_helper.dart';
import 'package:episode/Screens/todo_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:episode/themes/colors.dart';
import '../themes/colors.dart';
import 'calenderPage.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
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

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Todo> todoList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todoList == null) {
      todoList = List<Todo>();
      updateListView();
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                        child: getTodoListView()),
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
                      navigateToDetail(Todo('', '', ''), 'Add Todo');
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

// previous ui mixing
      ),
    );
  }

  ListView getTodoListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          // margin: EdgeInsets.symmetric(vertical: 10.0),
          // padding: EdgeInsets.all(20.0),
          // decoration: BoxDecoration(
          //   color: LightColors.kGreen,
          //   borderRadius: BorderRadius.circular(40.0),
          // ),
          // child: Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             // Padding(
          //             //   padding: const EdgeInsets.all(10.0),
          //             //   child: CircularPercentIndicator(
          //             //     animation: true,
          //             //     radius: 55.0,
          //             //     percent: 0.40,
          //             //     lineWidth: 5.0,
          //             //     circularStrokeCap: CircularStrokeCap.round,
          //             //     backgroundColor: Colors.white10,
          //             //     progressColor: Colors.white,
          //             //   ),
          //             // ),
          //             Container(
          //               padding: EdgeInsets.all(1),
          //               margin: EdgeInsets.all(5),
          //                 child: Text(this.todoList[position].title,
          //                   style: TextStyle(
          //                     fontSize: 16.0,
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               ),
          //           ],
          //         ),

          //         // here is the delete button

          //         GestureDetector(
          //           child: Icon(
          //             Icons.delete,
          //             color: Colors.red,
          //           ),
          //           onTap: () {
          //             _delete(context, todoList[position]);
          //           },
          //         ),
          //       ],
          //     ),
          //     Container(
          //       // alignment: AlignmentGeometry(),
          //       child: Text(
          //         this.todoList[position].description,
          //         style: TextStyle(
          //           fontSize: 13.0,
          //           color: Colors.white54,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

// main division ....................

          color: LightColors.kDarkYellow,
          elevation: 2.0,
          child: ListTile(
          //   // leading: CircleAvatar(
          //   backgroundColor: Colors.amber,
          //   child: Text(getFirstLetter(this.todoList[position].title),
          //       style: TextStyle(fontWeight: FontWeight.bold)),
          // ),
          title: Text(this.todoList[position].title,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(this.todoList[position].description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  _delete(context, todoList[position]);
                },
              ),
            ],
          ),
          onTap: () {
            debugPrint("ListTile Tapped");
            navigateToDetail(this.todoList[position], 'Edit Todo');
          },
          ),
        );
      },
    );
  }

  getFirstLetter(String title) {
    return title.substring(0, 2);
  }

  void _delete(BuildContext context, Todo todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Todo Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Todo todo, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TodoDetail(todo, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Todo>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todoList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }
}
