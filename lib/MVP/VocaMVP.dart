import 'package:learn_jp/DAO/chapter.dart';
import 'package:learn_jp/utils/Query.dart';

class VocaPresenter {
  final VocaView vocaView;
  VocaPresenter(this.vocaView);

  void getChapters() {
    Query()
        .getChapters()
        .then((c) => vocaView.chapters(c))
        .catchError((err) => vocaView.error(err.toString()));
  }
}

abstract class VocaView {
  void chapters(List<Chapter> chapter);
  void error(String err);
}
