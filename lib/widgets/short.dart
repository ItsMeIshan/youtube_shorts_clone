import 'package:flutter/material.dart';
import 'package:youtube_shorts_clone/bloc/models.dart';
import 'package:youtube_shorts_clone/screens/short_screen.dart';

class Short extends StatefulWidget {
  const Short({super.key, required this.short});
  final YoutubeShort short;

  @override
  State<Short> createState() => _ShortState();
}

class _ShortState extends State<Short> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ShortScreen(short: widget.short),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Hero(
          tag: widget.short.postId,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.short.submission.thumbnail),
              ),
            ),
            height: 300,
            width: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${widget.short.reaction.count}",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
