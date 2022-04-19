import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../components/g_buttons.dart';
import '../constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff125B50),
        title: text[_index],
        centerTitle: true,
      ),
      body: PageView.builder(
          itemCount: pages.length,
          controller: controller,
          onPageChanged: (page) {
            setState(() {
              _index = page;
            });
          },
          itemBuilder: (context, position) {
            return pages[position];
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GNav(
            selectedIndex: _index,
            onTabChange: (index) {
              setState(() {
                _index = index;
              });
              controller.jumpToPage(index);
            },
            padding: const EdgeInsets.all(16),
            tabBackgroundColor: const Color(0xffEEEEEE),
            backgroundColor: const Color(0xffFAF5E4),
            activeColor: const Color(0xffF8B400),
            color: const Color(0xff125B50),
            gap: 5,
            tabs: tabs),
      ),
    );
  }
}
