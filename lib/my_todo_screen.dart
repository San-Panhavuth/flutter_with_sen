import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTodoScreen extends StatefulWidget {
  const MyTodoScreen({super.key});

  @override
  State<MyTodoScreen> createState() => _MyTodoScreenState();
}

class _MyTodoScreenState extends State<MyTodoScreen> {
  List<Map<String, String>> todos = [];
  TextEditingController todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // loadTodos();
  }

  Future<void> createTodo() async {
    try {
      String uri = "http://10.0.84.62/todo/post_todo.php";
      var res = await http.post(Uri.parse(uri), body: {
        "text_todo": todoController.text,
      });
      print('Response body: ${res.body}');
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todo Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: todoController,
          ),
          ElevatedButton(
              onPressed: () {
                print(todoController.text);
                createTodo();
              },
              child: Text("Save")),
        ],
      ),
    );
  }
}
