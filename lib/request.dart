import 'dart:convert';
import 'utils.dart';
import 'package:app/models.dart';
import 'package:flutter/foundation.dart';
import 'data.dart';
import 'settings.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PropertyRequest {
  PropertyRequest(this.location, this.isForSale,
      [this.maxPrice = Settings.intMaxValue,
      this.minPrice = 0,
      this.maxRooms = Settings.intMaxValue,
      this.minRooms = 0,
      this.maxInternalArea = Settings.intMaxValue,
      this.minInternalArea = 0]);

  int? maxPrice, minPrice;
  int? maxRooms, minRooms;
  int? maxInternalArea, minInternalArea;
  String location;
  bool isForSale;
  Future<List<PropertyWithImage>> fetchProperties() async {
    final url =
        "${Settings.url}/public/properties/$location/$maxPrice/$minPrice/$maxRooms/$minRooms/$maxInternalArea/$minInternalArea/$isForSale";
    final response = await http.get(Uri.parse(url));
    return responseToProperties(response);
  }

  Future<List<PropertyWithImage>> jsonToListofProperties(
      Iterable<dynamic> list) async {
    List<PropertyWithImage> lst = [];
    for (var property in list) {
      lst.add(PropertyWithImage.fromJson(property));
    }
    return lst;
  }

  Future<List<PropertyWithImage>> fetchUserProperties() async {
    const url = "${Settings.url}/private/select/properties/";
    final response =
        await http.get(Uri.parse(url), headers: {"Authorization": data.token});
    if (response.statusCode == 400) {
      return [PropertyWithImage.redirectToLogin()];
    }
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      data.token = json['token'];
      return jsonToListofProperties(json['data']);
    }
    return [];
  }

  Future<List<PropertyWithImage>> responseToProperties(
      http.Response response) async {
    List<PropertyWithImage> list = [];
    if (response.statusCode == 200) {
      for (var json in jsonDecode(response.body)) {
        var propertyWithImage = PropertyWithImage.fromJson(json);
        list.add(propertyWithImage);
      }
    } else {
      throw Exception('Failed to load properties');
    }
    return list;
  }

  static void getAllLocations(List<String> locations) async {
    String url = "${Settings.url}/public/locations/";
    final response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    for (var location in json['locations']) {
      locations.add(location);
    }
  }

  factory PropertyRequest.empty() {
    return PropertyRequest("", true);
  }
}

class PropertyActionRequest extends Property {
  PropertyActionRequest(
    int id,
    price,
    bool isForSale,
    int numberOfRooms,
    String location,
    String address,
    int internalArea,
    String title,
    description,
    publishDate,
    int authorID,
    String orienter,
    String propertyType,
    bool isPublished,
  ) : super(
            id,
            price,
            isForSale,
            numberOfRooms,
            location,
            address,
            internalArea,
            title,
            description,
            publishDate,
            authorID,
            orienter,
            propertyType,
            null,
            isPublished);
  factory PropertyActionRequest.fromProperty(Property property) {
    return PropertyActionRequest(
        property.id,
        property.price,
        property.isForSale,
        property.numberOfRooms,
        property.location,
        property.address,
        property.internalArea,
        property.title,
        property.description,
        property.publishDate,
        property.authorID,
        property.orienter,
        property.propertyType,
        property.isPublished);
  }
  int delete() {
    String url = "${Settings.url}/private/delete/properties/";
    final response = http.post(Uri.parse(url),
        body: jsonEncode(toMap()),
        headers: {"Authorization": data.token}).timeout(Duration(seconds: 10));
    int errorCode = 0;
    response.then((value) {
      var json = jsonDecode(value.body);
      data.token = value.headers['token'] ?? "";
      errorCode = json["error"];
    });
    return errorCode;
  }

  void edit() {}
}

void register(User user) async {
  String url = "${Settings.url}/public/user/";
  http.post(Uri.parse(url), body: jsonEncode(user.toMap()));
  data.user = user;
}

void login(User user, void Function(int) onComplete) {
  String url = "${Settings.url}/public/login/";
  if (kDebugMode) user = Settings.debugUser;
  final response = http
      .post(Uri.parse(url), body: jsonEncode(user.toMap()))
      .timeout(Duration(seconds: 10));
  int errorCode = 0;
  response.then((value) {
    if (value.statusCode != 200) {
      errorCode = -1;
    } else {
      var token = jsonDecode(value.body);
      if (token['error'] != 0) {
        errorCode = token['error'];
      }
      data.token = token['token'];
    }
    onComplete(errorCode);
  }).onError((error, stackTrace) {
    onComplete(-1);
    return null;
  });
}
