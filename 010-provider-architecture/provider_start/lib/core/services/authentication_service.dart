import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  // inject our Api
  Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetchedUser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetchedUser != null;

    return hasUser;
  }
}
