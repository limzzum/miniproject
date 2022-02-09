import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HiddenText extends StatefulWidget {
  final String text;

  HiddenText({required this.text});

  @override
  _HiddenTextState createState() => new _HiddenTextState();
}

class _HiddenTextState extends State<HiddenText> {
  String firstHalf="";
  String secondHalf="";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ?  Text(firstHalf)
          :  Column(
        children: <Widget>[
           Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
           InkWell(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 Text(
                  flag ? "showMore".tr : "showLess".tr,
                  style:  TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
