import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_articles/domain/models/article_model.dart';

part 'articles_remote_data_source.g.dart';

// Ponieważ jest tutaj retrofit(@RestApi) i @injectable musimy
// dodatkowo oznaczyć jako @factoryMethod
@injectable
// gdy dodajemy BaseUrl w Injectable usuwamy z @RestApi() z DataSource'ów
@RestApi()
abstract class ArticlesRemoteRetrofitDataSource {
  //dodatkowo musimy pozbyć się w 1ym i 2gim DataSource -> {String baseUrl}
  @factoryMethod
  factory ArticlesRemoteRetrofitDataSource(Dio dio) =
      _ArticlesRemoteRetrofitDataSource;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();
}

// class ArticlesRemoteDioDataSource {
//   Future<List<Map<String, dynamic>>?> getArticles() async {
//     final response = await Dio().get<List<dynamic>>(
//         'http://my-json-server.typicode.com/adamsmaka/json-demo/articles');
//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }
//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }
