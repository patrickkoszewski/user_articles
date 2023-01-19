import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  // sut == system under testing
  ArticlesRepository sut;
  MockArticlesDataSource dataSource;

  // część kodu któa się wykonuje przed każdym testem na nowo
  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });
}
