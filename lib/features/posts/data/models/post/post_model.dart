import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';
@freezed
class PostModel with _$PostModel{
  factory PostModel({
    required String id,
    required String userId,
    required String imageUrl,
    required String text,
    required List<String> likes,
    required List<String> savedUsers,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String,dynamic> json) => _$PostModelFromJson(json);
}