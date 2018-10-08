import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_world_app/video_cell.dart';

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  _RealWorldAppState createState() => _RealWorldAppState();
}

class _RealWorldAppState extends State<RealWorldApp> {
  var _isLoading = true;
  var videos;

  _fetchData() async {
    print('Attempting to fetch data from the network.');

    final url = 'http://api.letsbuildthatapp.com/youtube/home_feed';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosJson = map['videos'];

      // videosJson.forEach((video) {
      //   print(video['name']);
      // });
      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Awesome App'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print('reloading...');
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            )
          ],
        ),
        body: new Center(
            child: _isLoading
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: this.videos != null ? this.videos.length : 0,
                    itemBuilder: (context, i) {
                      final video = this.videos[i];
                      return new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        child: new VideoCell(video),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new DetailPage()));
                        },
                      );
                    },
                  )),
      ),
    );
  }
}
