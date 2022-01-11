import 'package:flutter/material.dart';
import 'XKTabBar.dart';

class ChatItemData {
  String imgUrl;
  String name;
  String msg;
  String time;

  ChatItemData(this.name, this.msg, this.time, this.imgUrl);
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => new _HomeViewState();
}

class _HomeViewState extends State {
  List<ChatItemData> chatItems = [
    ChatItemData("UGC 4879", "你一点也不佛", "晚上21:53", "images/4879.jpg"),
    ChatItemData("刘德华", "今年的演唱会退票到账了吧？", "晚上9:00", "images/img.jpg"),
    ChatItemData("Lebron James", "We willl take over this game", "晚上8:46",
        "images/lebron.jpg"),
    ChatItemData("范冰冰", "帮我带饭啊", "晚上6:00", "images/xk.jpg"),
    ChatItemData("化作千风", "新出的专辑你听了么??😀", "下午3:32", "images/a002.jpg"),
    ChatItemData("恋橙柠檬茶", "我得挂个小飞机去了", "上午10:19", "images/a003.jpg"),
    ChatItemData("阿尔莎丝", "那就随意啦 ( •̀ ω •́ )✧", "1月9日", "images/a005.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildListView(),
    );
  }

  Widget renderChatItem(ChatItemData cid) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new XKTabBar();
          }));
        },
        leading: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: DecorationImage(
                  image: AssetImage(cid.imgUrl), fit: BoxFit.fill)),
          // child: Image.asset(
          //   cid.imgUrl,
          //   fit: BoxFit.cover,
          // ),
        ),
        title: new Text(cid.name),
        subtitle: new Text(cid.msg),
        trailing: Column(children: [
          Spacer(),
          Text(cid.time,
              style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          Spacer(),
          Spacer(),
        ]),
      ),
    );
  }

  ListView _buildListView() {
    return new ListView(children: chatItems.map(this.renderChatItem).toList());
  }
}
