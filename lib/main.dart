import 'package:flutter/material.dart';
import 'package:flutter_wechat/XKTabBar.dart';
import 'Home.dart';
import 'ContactView.dart';
import 'FindView.dart';
import 'MineView.dart';

void main() => runApp(new myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "title",
      theme: new ThemeData(
        primaryColor: Color.fromARGB(
            0xff, 0x1d, 0xc0, 0x63), //Color.fromARGB(0xff, 0xf2, 0xf2, 0xf2),
      ),
      home: new Center(
        child: new RandomWords(),
      ),
    );
  }
}

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  MAppBar({@required this.child}) : assert(child != null);
  final Widget child;
  @override
  Size get preferredSize {
    return new Size.fromHeight(51.0);
  }

  @override
  State createState() {
    return new MAppBarState();
  }
}

class MAppBarState extends State<MAppBar> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: true,
      child: widget.child,
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  static double itemwidth = 25.0;
  final List<BottomNavigationBarItem> listSet = [
    new BottomNavigationBarItem(
      icon: new Image.asset("assets/tabbar_mainframe@3x.png",
          width: itemwidth, height: itemwidth),
      activeIcon: new Image.asset("assets/tabbar_mainframeHL@3x.png",
          width: itemwidth, height: itemwidth),
      label: "微信",
    ),
    new BottomNavigationBarItem(
      icon: new Image.asset(
        "assets/tabbar_contacts@3x.png",
        width: itemwidth,
        height: itemwidth,
      ),
      activeIcon: new Image.asset(
        "assets/tabbar_contactsHL@3x.png",
        width: itemwidth,
        height: itemwidth,
      ),
      label: "通讯录",
    ),
    new BottomNavigationBarItem(
      icon: new Image.asset("assets/tabbar_discover@3x.png",
          width: itemwidth, height: itemwidth),
      activeIcon: new Image.asset("assets/tabbar_discoverHL@3x.png",
          width: itemwidth, height: itemwidth),
      label: "发现",
    ),
    new BottomNavigationBarItem(
      icon: new Image.asset("assets/tabbar_me@3x.png",
          width: itemwidth, height: itemwidth),
      activeIcon: new Image.asset("assets/tabbar_meHL@3x.png",
          width: itemwidth, height: itemwidth),
      label: "我",
    ),
  ];

  final List<StatefulWidget> vcSet = [
    new HomeView(),
    new ContactView(),
    new FindView(),
    new MineView()
  ];
  int _sindex = 2;
  String _title = "微信(7)";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: Colors.grey[100],
        canvasColor: Color(0xFFFFFFFF),
      ),
      home: buildHome(),
    );
  }

  Scaffold buildHome() {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(0xff, 0xf2, 0xf2, 0xf2),
        elevation: .5,
        centerTitle: true,
        title: new Text(_title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.black87,
            onPressed: () {},
          ),
          new IconButton(
            icon: new Icon(Icons.add_circle_outline),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey[300], width: 0.5))),
        child: new BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color.fromARGB(0xff, 0x26, 0x73, 0x25),
          items: listSet,
          type: BottomNavigationBarType.fixed,
          elevation: .5,
          onTap: (int index) {
            String title = "";
            switch (index) {
              case 0:
                title = "微信(7)";
                break;
              case 1:
                title = "通讯录";
                break;
              case 2:
                title = "发现";
                break;
              case 3:
                title = "我";
                break;
            }
            setState(() {
              _sindex = index;
              _title = title;
            });
            print("____$index");
          },
          currentIndex: _sindex,
        ),
      ),
      body: vcSet[_sindex],
    );
  }
}
