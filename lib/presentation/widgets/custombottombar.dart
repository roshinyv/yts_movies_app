import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/presentation/allitems/allitems.dart';
import 'package:yts_app/presentation/home/homepage.dart';
import 'package:yts_app/presentation/more/more.dart';
import 'package:yts_app/presentation/mylist/my_list.dart';
import 'package:yts_app/presentation/search/search.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

final _labels = ['Home', 'Search', 'All movies', 'My List', 'More'];
const List<Widget> _icons = [
  Icon(Icons.home),
  Icon(Icons.search),
  Icon(Icons.list_alt_outlined),
  Icon(Icons.add),
  Icon(Icons.menu),
];

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const Homepage(),
    SearchPage(),
    const AllItemsList(),
    MyList(),
    More(),
  ];

  void onTappedBar(int _index) {
    setState(() {
      currentIndex = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('===========BottomBar=========');
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CustomNavigationBar(
          blurEffect: true,
          iconSize: 25.0,
          selectedColor: kGoldenColor,
          strokeColor: const Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.black87,
          borderRadius: const Radius.circular(15.0),
          items: [
            for (int i = 0; i < _icons.length; i++)
              CustomNavigationBarItem(
                icon: _icons[i],
                title: Text(
                  _labels[i],
                  style: const TextStyle(color: kWhiteColor, fontSize: 12),
                ),
                selectedTitle: Text(
                  _labels[i],
                  style: TextStyle(color: kGoldenColor, fontSize: 12),
                ),
              ),
          ],
          currentIndex: currentIndex,
          onTap: onTappedBar,
          isFloating: true,
        ),
      ),
    );
  }
}
