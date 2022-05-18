//   import 'package:custom_navigation_bar/custom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class MyCustomBNavigation extends StatefulWidget {
//       @override
//       _MyCustomBNavigationState createState() => _MyCustomBNavigationState();
//     }

//     class _MyCustomBNavigationState extends State<MyCustomBNavigation> {
//       int _currentIndex = 0;
//       @override
//       void initState() {
//          pageController = PageController(
//           initialPage: _currentIndex,
//           keepPage: true,
//         );
//          super.initState();
//        }

//       @override
//       Widget build(BuildContext context) {
//         return Stack(
//           children: [
//             buildPageView(),
//             Positioned(
//                 left: 0, right: 0, bottom: 0, child: _buildBottomNavigationBar()),
//           ],
//         );
//       }

//       Widget _buildBottomNavigationBar() {
//         return _buildBlurEffect();
//       }

//       late PageController pageController;

//       final GlobalKey<FormFieldState<String>> orderFormKey = GlobalKey();

//       void pageChanged(int index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       }

//       Widget buildPageView() {
//         return PageView(
//           key: orderFormKey,
//           controller: pageController,
//           onPageChanged: (index) {
//             pageChanged(index);
//           },
//           children: <Widget>[
//           // You just need to replace your pages with this Container

//             Container(child: Center(child: Text("First"))),
//             Container(child: Center(child: Text("Second"))),
//             Container(child: Center(child: Text("Third"))),
//             Container(child: Center(child: Text("Fourth"))),
//             Container(child: Center(child: Text("Fifth"))),
//           ],
//         );
//       }

//       Widget _buildBlurEffect() {
//         return CustomNavigationBar(
//           iconSize: 30.0,
//           selectedColor: Colors.white,
//           strokeColor: Colors.white12,
//           unSelectedColor: Colors.grey[600],
//           backgroundColor: Colors.black,
//           borderRadius: Radius.circular(20.0),
//           blurEffect: true,
//           opacity: 0.8,
//           items: [
//             CustomNavigationBarItem(
//               icon: Icon(Icons.star),
//             ),
//             CustomNavigationBarItem(
//               icon: Icon(Icons.monetization_on),
//             ),
//             CustomNavigationBarItem(icon: Icon(Icons.star)),
//             CustomNavigationBarItem(
//               icon: Icon(Icons.monetization_on),
//             ),
//             CustomNavigationBarItem(
//               icon: Icon(Icons.share),
//             ),
//           ],
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//               setState(() {

//                 pageController.animateToPage(_currentIndex,
//                     duration: Duration(milliseconds: 500), curve: Curves.linear);
//               });
//             });
//           },
//           isFloating: true,
//         );
//       }
//     }
