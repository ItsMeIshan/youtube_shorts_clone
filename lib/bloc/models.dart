import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class YoutubeShort {
  final String postId;
  final Creator creator;
  final Comment comment;
  final Reaction reaction;
  final Submission submission;

  YoutubeShort({
    this.postId = '',
    this.creator = const Creator(),
    this.comment = const Comment(),
    this.reaction = const Reaction(),
    this.submission = const Submission(),
  });
  factory YoutubeShort.fromJson(Map<String, dynamic> json) => _$YoutubeShortFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeShortToJson(this);
}

@JsonSerializable()
class Creator {
  const Creator({this.name = '', this.handle = '', this.id = '', this.pic = ''});
  final String name;
  final String id;
  final String handle;
  final String pic;
  factory Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);
  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}

@JsonSerializable()
class Comment {
  const Comment({
    this.count = 0,
    this.commentingAllowed = false,
  });
  final int count;
  final bool commentingAllowed;
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class Reaction {
  const Reaction({
    this.count = 0,
    this.voted = false,
  });
  final int count;
  final bool voted;
  factory Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);
  Map<String, dynamic> toJson() => _$ReactionToJson(this);
}

@JsonSerializable()
class Submission {
  final String title;
  final String description;
  final String mediaUrl;
  final String thumbnail;
  final String hyperlink;
  final String placeholderUrl;

  const Submission({
    this.title = '',
    this.description = '',
    this.mediaUrl = '',
    this.thumbnail = '',
    this.hyperlink = '',
    this.placeholderUrl = '',
  });
  factory Submission.fromJson(Map<String, dynamic> json) => _$SubmissionFromJson(json);
  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}
