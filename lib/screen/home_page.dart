import 'package:flutter/material.dart';

import '../widget/add_todo_dialog.dart';
import '../widget/complelted_list.dart';
import '../widget/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      CompletedListWidget(),
      TodoListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 100),
            child: SizedBox(
              width: 50,
              height: 35,
              child: ElevatedButton(
                child: Image(
                  image: AssetImage("assets/images/addd.png"),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(290),
                            side: const BorderSide(color: Colors.blueGrey)))),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AddTodoDialogWidget(),
                  barrierDismissible: false,
                ),
              ),
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(right: 100.0),
            child: Text(
              "قائمة المهام",
              style: TextStyle(
                  fontSize: 30, fontFamily: "Cairo", color: Colors.black),
            ),
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[900],
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'المهام المكتملة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'فائمة اليوم',
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
