import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  // sut == system under testing
  // late mówi że jest jakaś wartość null bierzemy za to odpowiedzialność>
  // > i jeśli się mylili i faktycznie przyszedł by null>
  // > to może śmiało scrashować aplikacje.
  late ArticlesRepository sut;
  late MockArticlesDataSource dataSource;

  // część kodu któa się wykonuje przed każdym testem na nowo
  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });

  //nazwa metody z articles_repository.dart getArticlesForAuthorId
  group('getArticlesForAuthorId', () {
    test('should call remoteDataSource.getArticles() method', () async {
      //1 inicjalizacja when
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [],
      );
      //2 testowana metoda
      final results = await sut.getArticlesForAuthorId(555);
      //3
      verify(() => dataSource.getArticles()).called(1);
    });

    test('Data source should filter results with provided author id', () async {
      //1 getArticles - to co używamy w repository
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [
          ArticleModel(1, 555, 'content1', 'picture1'),
          ArticleModel(2, 333, 'content2', 'picture2'),
          ArticleModel(3, 555, 'content3', 'picture3'),
          ArticleModel(4, 555, 'content4', 'picture4'),
        ],
      );

      //2 wywołujmey metode jaką testujemy
      final results = await sut.getArticlesForAuthorId(555);
      //3 wywołanie funkcji expect(actual, matcher)
      // actual = results / matcher = to co spodziewamy się że się tam znajdzie
      expect(
        results,
        [
          ArticleModel(1, 555, 'content1', 'picture1'),
          ArticleModel(3, 555, 'content3', 'picture3'),
          ArticleModel(4, 555, 'content4', 'picture4'),
        ],
      );
    });
  });
}
