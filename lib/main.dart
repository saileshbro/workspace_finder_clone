import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/services.dart';
import 'package:workspace_finder_clone/assets.dart';
import 'package:flutter/cupertino.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, //top bar color
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefefe),
        fontFamily: 'SFProDisplay',
      ),
      home: HomePage(),
    );
  }
}

final List<String> chips = ['10+ People', 'Cafeteria', 'WIFI', 'Sports'];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Assets.lighterFontColor,
        selectedItemColor: Assets.heavyDark,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(""),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _horizontalChipSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: <Widget>[
                  _activityCard(),
                  _activityCard(),
                  _activityCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _activityCard() {
    return Container(
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(height: 160, color: Colors.grey[100]),
              ),
              Positioned(
                top: 18,
                right: 16,
                child: Icon(
                  FontAwesomeIcons.heart,
                  size: 15,
                  color: Assets.lighterDark.withOpacity(.5),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          4.8.toString(),
                          style: TextStyle(
                            color: Assets.boldFontColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '(21 ratings)',
                          style: TextStyle(color: Assets.lighterFontColor),
                        )
                      ],
                    ),
                    FlatButton(
                      color: Assets.heavyDark,
                      onPressed: () {},
                      child: Text(
                        '\$29/day',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '301 Broadway, Manhatten #5219',
                  style: TextStyle(
                    color: Assets.boldFontColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '40 People',
                      style: TextStyle(
                        color: Assets.lighterFontColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Assets.lighterFontColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Free Wifi',
                      style: TextStyle(
                        color: Assets.lighterFontColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Assets.lighterFontColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cafe',
                      style: TextStyle(
                        color: Assets.lighterFontColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _horizontalChipSlider() {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Row(
              children: <Widget>[
                SizedBox(
                  width: 18,
                ),
                Chip(
                  label: Text(
                    'New Filter',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Assets.lighterDark,
                  padding: EdgeInsets.all(8),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            );
          }
          return Row(
            children: <Widget>[
              Chip(
                label: Text(
                  chips[index - 1],
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Assets.lighterFontColor,
                padding: EdgeInsets.all(8),
              ),
              SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
        color: Assets.lighterFontColor.withOpacity(0.3),
      ))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 45.0, left: 25, right: 25, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  size: 20,
                  color: Assets.lighterFontColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Dec 29,9 am - 6 pm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.paperPlane,
                  size: 13,
                  color: Assets.lighterFontColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "New York, NY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
