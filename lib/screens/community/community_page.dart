import 'package:flutter/material.dart';
import 'package:miniproject/configs/application.dart';
import 'package:miniproject/data/network/repository.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(onPressed: (){}, child: Text('tokenreset'),),
    );
  }
}
