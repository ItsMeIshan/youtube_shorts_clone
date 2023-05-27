// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeShort _$YoutubeShortFromJson(Map<String, dynamic> json) => YoutubeShort(
      postId: json['postId'] as String? ?? '',
      creator: json['creator'] == null
          ? const Creator()
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      comment: json['comment'] == null
          ? const Comment()
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
      reaction: json['reaction'] == null
          ? const Reaction()
          : Reaction.fromJson(json['reaction'] as Map<String, dynamic>),
      submission: json['submission'] == null
          ? const Submission()
          : Submission.fromJson(json['submission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YoutubeShortToJson(YoutubeShort instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'creator': instance.creator,
      'comment': instance.comment,
      'reaction': instance.reaction,
      'submission': instance.submission,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      name: json['name'] as String? ?? '',
      handle: json['handle'] as String? ?? '',
      id: json['id'] as String? ?? '',
      pic: json['pic'] as String? ?? '',
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'handle': instance.handle,
      'pic': instance.pic,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      count: json['count'] as int? ?? 0,
      commentingAllowed: json['commentingAllowed'] as bool? ?? false,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'count': instance.count,
      'commentingAllowed': instance.commentingAllowed,
    };

Reaction _$ReactionFromJson(Map<String, dynamic> json) => Reaction(
      count: json['count'] as int? ?? 0,
      voted: json['voted'] as bool? ?? false,
    );

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'count': instance.count,
      'voted': instance.voted,
    };

Submission _$SubmissionFromJson(Map<String, dynamic> json) => Submission(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      mediaUrl: json['mediaUrl'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      hyperlink: json['hyperlink'] as String? ?? '',
      placeholderUrl: json['placeholderUrl'] as String? ?? '',
    );

Map<String, dynamic> _$SubmissionToJson(Submission instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'mediaUrl': instance.mediaUrl,
      'thumbnail': instance.thumbnail,
      'hyperlink': instance.hyperlink,
      'placeholderUrl': instance.placeholderUrl,
    };
