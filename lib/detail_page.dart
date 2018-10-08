import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  var selectedVideoId;

  DetailPage({this.selectedVideoId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _isLoading = true;
  var _details;

  _fetchData() async{
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
