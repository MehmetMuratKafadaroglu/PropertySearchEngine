import 'package:app/auth/login_page.dart';
import "package:flutter/material.dart";
import '../data.dart';
import "../models.dart";
import '../widgets/sign_in_lock.dart';
import '../widgets/no_item_page.dart';
import '../request.dart';
import 'property_listview.dart';

PropertyRequest request = PropertyRequest.empty();

class UserPropertiesPage extends StatefulWidget {
  UserPropertiesPage({Key? key}) : super(key: key);
  bool show = true;
  @override
  State<UserPropertiesPage> createState() => _UserPropertiesPageState();
}

class _UserPropertiesPageState extends State<UserPropertiesPage> {
  @override
  Widget build(BuildContext context) {
    void changeState() => setState(() => widget.show = data.token.isEmpty);
    LoginPage loginPage = LoginPage(changeParentState: changeState);
    if (widget.show) {
      return SignInLock(redirectTo: loginPage);
    }
    return Column(children: [
      Expanded(
        child: FutureBuilder<List<PropertyWithImage>>(
            future: request.fetchUserProperties(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return NoItemPage();
              }
              if (snapshot.data?.first.property.id == -1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginPage));
              }
              return PropertyListview(items: snapshot.data ?? []);
            }),
      )
    ]);
  }
}
