import 'package:flutter/material.dart';
import 'package:todo_list_app/home.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/list_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Custom AppBar Size',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
