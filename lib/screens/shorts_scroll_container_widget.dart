import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:youtube_shorts_clone/bloc/models.dart';
import 'package:youtube_shorts_clone/bloc/short_service.dart';
import 'package:youtube_shorts_clone/screens/short_screen.dart';

class ShortsScrollContainer extends StatefulWidget {
  const ShortsScrollContainer({super.key, required this.pageKey});
  final int pageKey;
  @override
  State<ShortsScrollContainer> createState() => _ShortsScrollContainerState();
}

class _ShortsScrollContainerState extends State<ShortsScrollContainer> {
  late PagingController<int, YoutubeShort> _pagingController;

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = ShortService().getVideosFn(pageKey);
      response.then((list) {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(list, nextPageKey);
      });
    } catch (e) {
      debugPrint("error >>>>:  $e");
      _pagingController.error = e;
    }
  }

  void initState() {
    _pagingController = PagingController(firstPageKey: widget.pageKey);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    // _pagingController.itemList = []
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, YoutubeShort>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<YoutubeShort>(
            itemBuilder: (context, item, index) =>
                ShortScreen(short: item,),
          ),
        ),
      ),
    );
  }
}
