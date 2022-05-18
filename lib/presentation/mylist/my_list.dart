import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text('My List'),
          actions: [
            Row(
              children: const [
                Icon(Icons.edit),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Edit',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
        // bottomNavigationBar: const CustomBottomBar(),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.green,
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg'))),
                  );
                }),
          ),
        ]));
  }
}
