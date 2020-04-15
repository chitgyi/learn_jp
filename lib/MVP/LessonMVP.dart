import 'package:learn_jp/DAO/words.dart';
import 'package:learn_jp/utils/Query.dart';

class LessonPresenter {
  final LessonView lessonView;
  LessonPresenter(this.lessonView);

  void getWords(int id) {
    Query()
        .getVocabulary(id)
        .then((c) => lessonView.words(c))
        .catchError((err) => lessonView.error(err.toString()));
  }
}

abstract class LessonView {
  void words(List<Words> words);
  void error(String err);
}
