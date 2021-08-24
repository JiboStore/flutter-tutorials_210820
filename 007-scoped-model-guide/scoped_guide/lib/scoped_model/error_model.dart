import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/scoped_model/base_model.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/services/storage_service.dart';

class ErrorModel extends BaseModel {
  StorageService storageService = locator<StorageService>();
  String title = "ErrorModel";

  Future saveData() async {
    setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saved";
    setState(ViewState.Retrieved);
  }

  // ViewState _state;
  // ViewState get state => _state;

  // void _setState(ViewState newState) {
  //   _state = newState;
  //   notifyListeners();
  // }

  // Future saveData() async {
  //   _setState(ViewState.Busy);
  //   title = "Saving Data";
  //   await storageService.saveData();
  //   title = "Data Saved";
  //   _setState(ViewState.Retrieved);
  // }
}
