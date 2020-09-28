import 'package:flutter/material.dart';
import 'package:episode/Screens/homeScreen.dart';
// ignore: unused_import
import 'package:episode/Screens/todo_detail.dart';

void main() {
	runApp(TodoApp());
}

class TodoApp extends StatelessWidget {

	@override
  Widget build(BuildContext context) {

    return MaterialApp(
	    title: 'Episode',
	    debugShowCheckedModeBanner: false,
	    theme: ThemeData(
		    primarySwatch: Colors.blue
	    ),
	    home: TodoList(),
    );
  }
}