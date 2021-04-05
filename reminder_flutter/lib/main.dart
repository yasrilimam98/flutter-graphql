import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

// Halaman page untuk dihubungi
import 'src/screens/all_reminder.dart';
import 'src/screens/new_reminder.dart';

void main() {
  GetIt.instance.registerSingleton<Client>(initClient(
    'http://localhost:8081/v1/graphql',
    DotEnv().env['HASURA_GRAPHQL_ADMIN_SECRET'],
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'FLutter Reminder',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => AllReminderScreen(),
        '/new': (_) => NewReminderScreen(),
      },
    );
  }
}
