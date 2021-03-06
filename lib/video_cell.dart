import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(video['imageUrl']),
              new Text(
                video['name'],
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}

