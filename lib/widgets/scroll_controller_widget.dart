// import 'package:flutter/material.dart';
//
// class CustomScrollController extends StatefulWidget {
//
//   @override
//   _CustomScrollControllerState createState() => _CustomScrollControllerState();
// }
// class _CustomScrollControllerState extends State<CustomScrollController> {
//   late bool _isLastPage;
//   late int _pageNumber;
//   late bool _error;
//   late bool _loading;
//   late int _numberOfPostsPerRequest;
//   late ScrollController _scrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageNumber = 0;
//     _isLastPage = false;
//     _loading = true;
//     _error = false;
//     _numberOfPostsPerRequest = 10;
//     _scrollController = ScrollController();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _scrollController.addListener(() {
//       var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
//
//       if (_scrollController.position.pixels > nextPageTrigger) {
//         _loading = true;
//         ///Todo: fetchData here
//         // fetchData();
//       }
//     });
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Blog App"), centerTitle: true,),
//       body: buildPostsView(),
//     );
//   }
//
//   Widget buildPostsView() {
//     if (_posts.isEmpty) {
//       if (_loading) {
//         return const Center(
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: CircularProgressIndicator(),
//             ));
//       } else if (_error) {
//         return Center(
//             child: errorDialog(size: 20)
//         );
//       }
//     }
//     return ListView.builder(
//         controller: _scrollController,
//         itemCount: _posts.length + (_isLastPage ? 0 : 1),
//         itemBuilder: (context, index) {
//
//           if (index == _posts.length) {
//             if (_error) {
//               return Center(
//                   child: errorDialog(size: 15)
//               );
//             }
//             else {
//               return const Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(8),
//                     child: CircularProgressIndicator(),
//                   ));
//             }
//           }
//
//           final Post post = _posts[index];
//           return Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: PostItem(post.title, post.body)
//           );
//         }
//     );
//   }
//
// }