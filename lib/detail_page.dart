import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Details'),
      ),
      body: new Center(child: new Text('Details will show here.')),
    );
  }
}
