import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/todos.dart';
import 'package:todolist/screen/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: splashscreen(),
        ),
      );
}
