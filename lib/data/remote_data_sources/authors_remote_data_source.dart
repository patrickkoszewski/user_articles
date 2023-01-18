import 'package:dio/dio.dart';

//przychodzi nam lista [] elementów
class AuthorsRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getAuthors() async {
    final response = await Dio().get<List<dynamic>>(
        'http://my-json-server.typicode.com/adamsmaka/json-demo/users');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    // przechodzimy przez wszystkie dynamic i konwerttujemy go by
    // zwracało nam liste której potrzebujemy <List<Map<String, dynamic>>
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
