import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Msg {
  bool isMe;
  String msg;
  Msg(this.isMe, this.msg);
}

class XKTabBar extends StatelessWidget {
  var styleSomebody = BubbleStyle(
      nip: BubbleNip.leftCenter,
      color: Colors.white,
      borderColor: Colors.grey[100],
      borderWidth: .5,
      elevation: 1,
      nipWidth: 6,
      margin: BubbleEdges.only(top: 3, right: 50),
      alignment: Alignment.topLeft,
      padding: BubbleEdges.symmetric(horizontal: 15, vertical: 10));

  var styleMe = BubbleStyle(
      nipWidth: 6,
      nip: BubbleNip.rightCenter,
      color: Color(0xFF98E970),
      // borderColor: Colors.grey[100],
      borderWidth: .5,
      // elevation: 1,
      margin: BubbleEdges.only(top: 8, left: 50),
      alignment: Alignment.topRight,
      padding: BubbleEdges.symmetric(horizontal: 15, vertical: 10));

  Widget render4879(String msg) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                        image: AssetImage("images/4879.jpg"),
                        fit: BoxFit.fill))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("可爱的小胡啊",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  Bubble(
                      style: styleSomebody,
                      child: Text(msg,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.black87))),
                ],
              ),
            ),
          ]),
    );
  }

  Widget renderMe(String msg) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Bubble(
                  style: styleMe,
                  child: Text(msg,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16.0, color: Colors.black87))),
            ),
            Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                        image: AssetImage("images/me.png"), fit: BoxFit.fill))),
          ]),
    );
  }

  var msgs = List<Msg>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    msgs.add(Msg(false, "我刚才看见一个"));
    msgs.add(Msg(false, "22岁一天相亲20次"));
    msgs.add(Msg(false, "刚回家就被安排了"));
    msgs.add(Msg(true, "😮还有这种事"));
    msgs.add(Msg(true, "那是真累"));
    msgs.add(Msg(true, "农村的啊"));
    msgs.add(Msg(false, "那没事了"));
    msgs.add(Msg(false, "哈哈哈"));
    msgs.add(Msg(true, "虽然超常了"));
    msgs.add(Msg(true, "一天相5-6个还是挺正常的"));
    msgs.add(Msg(false, "👀"));

    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_sharp,
            size: 32,
            color: Colors.grey[600],
          ),
          color: Colors.black87,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(0xff, 0xf2, 0xf2, 0xf2),
        elevation: .2,
        centerTitle: true,
        title: new Text("UGC 4879",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20)),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.more_horiz),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      body: new Container(
        alignment: Alignment.bottomCenter,
        decoration:
            BoxDecoration(color: Color.fromARGB(0xff, 0xf2, 0xf2, 0xf2)),
        child: ListView(
          children: msgs.map((m) {
            return m.isMe ? renderMe(m.msg) : render4879(m.msg);
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromARGB(0xff, 0xf4, 0xf4, 0xf4),
            border: Border(top: BorderSide(color: Colors.black87, width: .05))),
        child: Row(
          children: [
            Container(
              width: 48,
              child: Icon(
                Icons.mic,
                size: 28,
              ),
            ),
            // TextField(),
            Container(
              height: 35,
              width: 278,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[600], width: 0.01),
                  borderRadius: BorderRadius.circular(2)),
            ),
            Container(
                width: 42,
                child: Icon(Icons.emoji_emotions_outlined, size: 28)),
            Container(
                width: 42, child: Icon(Icons.add_circle_outline, size: 28))
          ],
        ),
      ),
    );
  }
}
