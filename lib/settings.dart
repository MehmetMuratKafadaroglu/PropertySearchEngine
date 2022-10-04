import "package:flutter/material.dart";
import 'models.dart';

abstract class Settings {
  static const String url = "http://192.168.56.1:8000";
  static const String defaultImage =
      "${Settings.url}/assets/property_images/default.png";
  static const backgroundColor = Color.fromARGB(255, 86, 118, 87);
  static const secondaryBackgroundColor = Color.fromARGB(255, 61, 118, 124);
  static const String defaultCity = "Tashkent";
  static const String homePageName = "Search Properties";
  static const String profilePageName = "Profile";
  static const String userPropertiesPageName = "Your Properties";
  static const String fillLocationMessage = "Location cannot be empty\n\n\n";
  static const int intMaxValue = 10000000;
  static const String close = "Close";
  static String noPropertyExistLabel = "No Property Exists";

  static String currency = "£";
  static String room = "room";
  static String added = "Added";
  static String forPrice = "for";
  static String yourProperties = "Your Properties";
  static String enterLocation = "Enter a location please";

  static String priceRange = "Price Range";
  static String address = "Address";
  static String title = "Title";
  static String location = "Location";
  static String bedrooms = "Number of Bedrooms";
  static String internalArea = "Internal Area";
  static String min = "Min";
  static String max = "Max";
  static String sale = "Sale";
  static String rent = "Rent";
  static String apply = "Apply";
  static String price = "Price";
  static String edit = "Edit";
  static String delete = "Delete";

  static const String serverErrorMessage = "Server error try later please\n\n";
  static const String genericErrorMessage = "Error\n\n";
  static String passwordsDoesNotMatchMessage =
      "Email and Password doesn't match\n\n";
  static String userDoesNotExistMessage =
      "User does not exist\nPlease Register\n";

  static String exampleEmail = "andrewsmith@gmail.com";
  static String submit = "Submit";
  static String register = "Register";
  static String login = "Log in";

  static User debugUser = User.fromEmailandPassword(
      "mehemtmuratkafadaroglu@gmail.com", "123456789");
  static String alert = "Alert!";
  static String confirmationMessage =
      "Are you sure you want to delete this property";
  static String cancel = "Cancel";
  static String filter = "Filter";
}
