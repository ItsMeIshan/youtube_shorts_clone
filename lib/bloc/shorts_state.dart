import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/bloc/models.dart';

class ShortState extends ChangeNotifier {
  int _currentIdx = 0;
  int _page = 0;
  String previousFirstId = '';
  List<YoutubeShort> _shorts = [];
  PageController controller = PageController();

  int get currentIndex => _currentIdx;

  set currentIndex (int idx) {
    _currentIdx = idx;
    notifyListeners();
  }
  int get page => _page;
  set page (int page) {
    _page =  page;
    notifyListeners();
  }
  List<YoutubeShort> get shorts => _shorts;
  set shorts(List<YoutubeShort> list) {
    _shorts.addAll(list);
    notifyListeners();
  }

  void nextShort() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

}