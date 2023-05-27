import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_shorts_clone/bloc/models.dart';

class ShortScreen extends StatefulWidget {
  const ShortScreen({
    super.key,
    this.short,
  });
  final YoutubeShort? short;

  @override
  State<ShortScreen> createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  late ChewieController _chewieController;
  bool pauseStatus = true;
  final PagingController<int, YoutubeShort> _pagingController =
  PagingController(firstPageKey: 0);


  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        widget.short!.submission.mediaUrl,
        videoPlayerOptions: VideoPlayerOptions(),
      ),
      aspectRatio: 5 / 10,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      draggableProgressBar: false,
      showControls: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.pause();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.short == null) {
      return const Center(child: Text("Something Went Wrong!"));
    }
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
          child: InkWell(
            onTap: () {
              if (pauseStatus) {
                _chewieController.pause();
              } else {
                _chewieController.play();
              }
              pauseStatus = !pauseStatus;
            },
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Chewie(
                controller: _chewieController,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(widget.short!.creator.pic),
                              ),
                            ),
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(width: 5,),
                          Text('@${widget.short!.creator.name == '' ? 'user' : widget.short!.creator.name}', style: TextStyle(fontWeight: FontWeight.w900),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              )
            ]),
          ),
        ),
    );
  }
}
