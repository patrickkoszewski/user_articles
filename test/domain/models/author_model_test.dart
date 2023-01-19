import 'package:test/test.dart';
import 'package:user_articles/domain/models/author_model.dart';

void main() {
  test('will getter name return first and second name combined', () {
    // 1. Przygotować dane
    final model = AuthorModel(1, '', 'Kamil', 'Kowalski');

    // 2. Wywołanie metody którą chcemy przetestować
    final result = model.name;

    // 3. Skorzystanie z metody expect (oczekuj)
    expect(result, 'Kamil Kowalski');
  });
}
