import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/author_model.dart';

part 'authors_remote_data_source.g.dart';

@RestApi(baseUrl: "http://my-json-server.typicode.com/adamsmaka/json-demo")
abstract class AuthorsRemoteRetrofitDataSource {
  factory AuthorsRemoteRetrofitDataSource(Dio dio, {String baseUrl}) =
      _AuthorsRemoteRetrofitDataSource;

  @GET("/users")
  Future<List<AuthorModel>> getAuthors();
}

// //przychodzi nam lista [] elementów
// class AuthorsRemoteDioDataSource {
//   Future<List<Map<String, dynamic>>?> getAuthors() async {
//     final response = await Dio().get<List<dynamic>>(
//         'http://my-json-server.typicode.com/adamsmaka/json-demo/users');
//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }
//     // przechodzimy przez wszystkie dynamic i konwerttujemy go by
//     // zwracało nam liste której potrzebujemy <List<Map<String, dynamic>>
//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }
