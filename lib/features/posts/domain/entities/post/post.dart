import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
@freezed
class Post with _$Post{
  factory Post({
    required String id,
    required String userId,
    required String imageUrl,
    required String text,
    required List<String> likes,
    required List<String> savedUsers,
}) = _Post;
}