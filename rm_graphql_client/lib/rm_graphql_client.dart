import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

export 'src/graphql/operations.req.gql.dart';
export 'src/graphql/operations.data.gql.dart';
export 'src/graphql/operations.var.gql.dart';
export 'src/graphql/schema.schema.gql.dart';

Client initClient(String uri, String secret) {
  final link = HttpLink(uri, defaultHeaders: {
    'x-hasura-admin-secret': secret,
  });
  final cache = Cache();
  final client = Client(link: link, cache: cache);
  return client;
}
