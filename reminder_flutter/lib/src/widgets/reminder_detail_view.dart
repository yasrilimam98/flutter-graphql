import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class ReminderDetail extends StatelessWidget {
  final GFetchRecipeListData_recipes recipe;
  const ReminderDetail({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text(recipe.name,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navLargeTitleTextStyle)
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
