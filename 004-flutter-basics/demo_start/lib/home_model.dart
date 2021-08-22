import 'dart:async';

enum HomeViewState {
  Busy,
  DataRetrieved,
  NoData,
}

class HomeModel {
  List<String> listItems;

  final StreamController<HomeViewState> stateController =
      StreamController<HomeViewState>();

  // Stream that broadcast the home state
  Stream<HomeViewState> get homeState => stateController.stream;

  Future getListData({bool hasError = false, bool hasData = true}) async {
    stateController.add(HomeViewState.Busy);
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      // return Future.error(
      //     'An error occurred while fetching the data. Please try again later');
      return stateController.addError(
          'An error occurred while fetching the data. Please try again later');
    }

    if (!hasData) {
      return stateController.add(HomeViewState.NoData);
    }

    listItems = List<String>.generate(10, (index) => '$index title');
    stateController.add(HomeViewState.DataRetrieved);
  }
}
