import 'package:youtube_shorts_clone/screens/short_screen.dart';
import 'package:youtube_shorts_clone/screens/video_list_screen.dart';

var appRoutes = {
  '/videos': (context) => const VideoListScreen(),
  '/short': (context) => const ShortScreen(),
};