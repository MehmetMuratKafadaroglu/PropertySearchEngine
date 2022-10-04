import 'request.dart';
import 'models.dart';

Data data = Data();

class Data {
  Data() {
    PropertyRequest.getAllLocations(locations);
  }
  List<String> locations = [];
  User user = User.emptyUser();
  String token = '';
}
