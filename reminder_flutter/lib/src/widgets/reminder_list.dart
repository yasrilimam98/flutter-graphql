import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'reminder_detail_view.dart';

class ReminderList extends StatelessWidget {
  final GFetchRecipeListData_recipes recipe;
  const ReminderList({Key key, @required this.recipe}) : super(key: key);

  // Buat fungsi void untuk menghapus berdasarkan id
  void _removeReminder(BuildContext context, int recipeId) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          icon: CupertinoIcons.pencil,
          color: Colors.blueGrey,
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Delete" ${recipe.name}"'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('Delete'),
                      onPressed: () {
                        _removeReminder(context, recipe.id);
                      },
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                // Ngambil dari dari file reminder detail view
                builder: (context) => ReminderDetail(recipe: recipe),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      // Mengambil data gambar dari database
                      image: NetworkImage(
                          recipe.image_url ?? 'https://placehold.it/100x100'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        recipe.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          )
        ],
      ),
    );
  }
}
