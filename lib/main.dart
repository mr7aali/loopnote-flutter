import "package:flutter/material.dart";

import 'app_theme.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: AppTheme.light,
      home: Scaffold(
        body: Center(child: Text("Hello World")),
        appBar: AppBar(
          title: Text("Home"),
          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          toolbarOpacity: 1.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Container(
              color: AppColors.highlightColor,
              width: MediaQuery.of(context).size.width,
              //   height: 50,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "This is bottom",
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: "Settings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
