import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<String> _pageData = [];

  // Return a list of data after 1 second to emulate network request
  Future<List<String>> _getListData() async {
    await Future.delayed(Duration(seconds: 1));
    return List<String>.generate(10, (index) => '$index title');
  }

  @override
  void initState() {
    _getListData().then((data) {
      setState(() {
        _pageData = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _pageData.length,
          itemBuilder: (buildContext, index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              height: 50.0,
              color: Colors.grey[700],
              child: Text(_pageData[index]),
            );
          }),
    );
  }
}
