import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/g_buttons.dart';
import '../constants/constants.dart';

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
      backgroundColor: const Color(0xffF1F2F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: kPrimaryColor,
          title: text[_index],
          centerTitle: true,
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(30),
          //         bottomLeft: Radius.circular(30))),
          shadowColor: Colors.transparent,
        ),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GNav(
            selectedIndex: _index,
            onTabChange: (index) {
              setState(() {
                _index = index;
              });
              controller.jumpToPage(index);
            },
            padding: const EdgeInsets.all(12),
            tabBorderRadius: 10,
            backgroundColor: kNavBarBackgroundColor,
            tabBackgroundColor: const Color(0xffEEEEEE),
            activeColor: const Color(0xff545454),
            color: kPrimaryColor,
            gap: 5,
            tabs: tabs),
      ),
    );
  }
}
