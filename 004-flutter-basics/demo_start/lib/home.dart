import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basics/home_model.dart';

class Home extends StatefulWidget {
  /*
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
  */

  // Return a list of data after 1 second to emulate network request
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeModel model = HomeModel();

  @override
  void initState() {
    model.getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // we want to refresh, but this actually does nothing, which is the limitation
          model.getListData();
        }),
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
          stream: model.homeState,
          builder: (buildContext, snapshot) {
            // error ui
            if (snapshot.hasError) {
              return _getInformationMessage(snapshot.error);
            }
            // Busy fetching data
            if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
              return Center(child: CircularProgressIndicator());
            }

            // var listItems = snapshot.data;

            // when empty data is returned
            // if (listItems.length == 0) {
            if (snapshot.data == HomeViewState.NoData) {
              return _getInformationMessage('No data found for your account');
            }

            // build list if we have data
            return ListView.builder(
                itemCount: model.listItems.length,
                itemBuilder: (buildContext, index) {
                  return _getListItemUi(index, model.listItems);
                });
          },
        ));
  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey[600],
      ),
      child: Center(
          child: Text(
        listItems[index],
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.grey[500])));
  }
}

/*
class _HomeState extends State<Home> {
  List<String> _pageData;

  bool get _fetchingData => _pageData == null;

  // Return a list of data after 1 second to emulate network request
  Future<List<String>> _getListData(
      {bool hasError = false, bool hasData = true}) async {
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return Future.error(
          'An error occurred while fetching the data. Please try again later');
    }

    if (!hasData) {
      return [];
    }

    return List<String>.generate(10, (index) => '$index title');
  }

  @override
  void initState() {
    _getListData(hasError: false).then((data) {
      setState(() {
        if (data.length == 0) {
          data.add(
              'No data found for your account. Add something and check back');
        }
        _pageData = data;
      });
    }).catchError((error) {
      setState(() {
        _pageData = [error];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _fetchingData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _pageData.length,
                itemBuilder: (buildContext, index) => _getListItemUi(index),
              ));
  }

  Widget _getListItemUi(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey[600],
      ),
      child: Center(
          child: Text(
        _pageData[index],
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
*/