import 'package:flutter/cupertino.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

import '../widgets/no_reminder.dart';
import '../widgets/reminder_list.dart';

class AllReminderScreen extends StatelessWidget {
  AllReminderScreen({Key key}) : super(key: key);

  final recipesReq = GFetchRecipeListReq();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("All Reminder"),
            trailing: CupertinoButton(
                padding: const EdgeInsets.all(5),
                onPressed: () {
                  Navigator.pushNamed(context, '/new');
                },
                child: Icon(
                  CupertinoIcons.plus_rectangle_fill,
                  size: 30,
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Manggil dari widget yang dibuat

                Operation(
                  operationRequest: recipesReq,
                  builder: (context,
                      OperationResponse<GFetchRecipeListData,
                              GFetchRecipeListVars>
                          response) {
                    if (response.loading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final recipes = response.data.recipes;

                    if (recipes.isEmpty) {
                      return NoReminder();
                    }

                    return Column(
                      children: [
                        for (var index = 0; index < recipes.length; index++)
                          ReminderList(
                            recipe: recipes[index],
                          ),
                      ],
                    );
                    return Text(response.data.toJson().toString());
                  },
                  client: GetIt.instance<Client>(),
                ),
                // for (var i = 0; i < 100; i++) Text('Reminder $i')
              ],
            ),
          )
        ],
      ),
    );
  }
}
