import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/bloc/models.dart';
import 'package:youtube_shorts_clone/bloc/short_service.dart';
import 'package:youtube_shorts_clone/bloc/shorts_state.dart';
import 'package:youtube_shorts_clone/utils/image_constants.dart';
import 'package:youtube_shorts_clone/widgets/gradient_text.dart';
import 'package:youtube_shorts_clone/widgets/short.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final PagingController<int, YoutubeShort> _pagingController =
      PagingController(firstPageKey: 0);
  Future<List<YoutubeShort>>? shortsFuture;
  late final ShortState shortsState;

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = ShortService().getVideosFn(pageKey);
      response.then((list) {
        shortsState.shorts = list;
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(list, nextPageKey);

      });
    } catch (e) {
      debugPrint("error >>>>:  $e");
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    shortsState = Provider.of<ShortState>(context, listen: false);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: const [
              Icon(Icons.slow_motion_video_sharp, color: Color(0xffcaacf9),),
              SizedBox(width: 5,),
              Text("Videos", style: TextStyle(color: Color(0xffcfb3f6)),),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.circleUser,
                color: Color(0xffcaacf9),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageConstants.shortsIcon, height: 40, width: 30,),
                    const SizedBox(width: 15,),
                    GradientText('Shorts', gradient: const LinearGradient(colors: [Color(0xff6e4fe9), Color(
                        0xff7f3bec),Color(0xd39a65ea),Color(0xffcaacf9) ]), style: Theme.of(context).textTheme.displayLarge,),
                    // Text(
                    //   'Shorts',
                    //   style: Theme.of(context).textTheme.displayLarge,
                    // ),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: () => Future.sync(() => _pagingController.refresh()),
                child: Wrap(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: PagedGridView<int, YoutubeShort>(
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        pagingController: _pagingController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 100 / 150,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 4,
                          crossAxisCount: 3,
                        ),
                        builderDelegate: PagedChildBuilderDelegate<YoutubeShort>(
                          itemBuilder: (context, item, index) =>
                              Short(short: item),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),);
  }
}
