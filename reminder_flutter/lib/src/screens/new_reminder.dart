import 'package:flutter/cupertino.dart';

class NewReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Add Reminder"),
      ),
      child: CustomScrollView(),
    );
  }
}
