import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
  StorageService storageService = locator<StorageService>();
  String title = "HomeModel";

  ViewState _state;
  ViewState get state => _state;

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  Future saveData() async {
    _setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saved";
    _setState(ViewState.Retrieved);
  }
}
