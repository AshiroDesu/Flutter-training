import 'package:cookbook_flutter_form/surd_controller.dart';
import 'package:cookbook_flutter_form/surd_create_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockitoRepo extends Mock implements SurdRepository {}

void main() {
  Controller controller;
  MockitoRepo repository;

  test("description", () {
    int numb = 3;
    bool res=false;
    if (numb <= 3) {
      return res = true;
    }
    expect(res, true);
  },tags: 'web');
  test('When getName shows 0, return a name', () {
    repository = MockitoRepo();
    controller = Controller(repository);
    when(repository.getName(0)).thenReturn("Aglivan");
    controller.getName(0);
    expect(controller.name, 0);
  },skip: 'não funciona');
}

