import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalavarana/HomePage.dart';
import 'package:kalavarana/shopPage.dart';
import 'package:kalavarana/styles.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: appBar(),
          preferredSize: Size.fromHeight(context.height * 0.13),
        ),
        endDrawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                navTitle("Home", 0),
                navTitle("Shop", 1),
                navTitle("About us", 2),
                navTitle("Blogs", 3),
                navTitle("contact us", 4)
              ],
            ),
          ),
        ),
        body: selectedIndex == 0 ? HomePage() : ShopPage());
  }

  LayoutBuilder appBar() {
    return LayoutBuilder(
      builder: (context, d) {
        if (d.maxWidth > 1000) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset('assets/logo.png'),
                  ),
                  Row(
                    children: [
                      navTitle("Home", 0),
                      navTitle("Shop", 1),
                      navTitle("About us", 2),
                      navTitle("Blogs", 3),
                      navTitle("contact us", 4)
                    ],
                  ),
                  Row(
                    children: [
                      searchBar(),
                      SizedBox(
                        width: 30,
                      ),
                      Image.asset("assets/cart.png")
                    ],
                  )
                ],
              ),
            ),
          );
        } else
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset('assets/logo.png'),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 32,
                      ),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 32,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
      },
    );
  }

  Widget navTitle(String text, int index) {
    return InkWell(
      onTap: () {
        if (context.width < 800) Navigator.pop(context);
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: navItem.copyWith(
              color: selectedIndex == index ? yellow : darkYellow),
        ),
      ),
    );
  }

  Container searchBar() {
    return Container(
      width: 187,
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: Align(alignment: Alignment.centerRight, child: Icon(Icons.search)),
    );
  }
}
