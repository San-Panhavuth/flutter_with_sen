import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class ReadTodoScreen extends StatefulWidget {
  const ReadTodoScreen({super.key});

  @override
  State<ReadTodoScreen> createState() => _ReadTodoScreenState();
}

class _ReadTodoScreenState extends State<ReadTodoScreen> {

    Future loadTodos() async {
    try {
      const uri = "http://10.0.84.62/todo/read_todo.php";
      var response = await http.get(Uri.parse(uri));
      return jsonDecode(response.body);
    } catch (e) {
      print("Failed to load todos: $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
              future: loadTodos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return ListTile(
                            title: Text(list[index]['text_todo']),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
    );
  }
}