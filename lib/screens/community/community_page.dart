import 'package:flutter/material.dart';
import 'package:miniproject/configs/application.dart';

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
      child: TextButton(onPressed: (){Application.preferences.remove(KEY.accessToken);}, child: Text('tokenreset'),),
    );
  }
}
