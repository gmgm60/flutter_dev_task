import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';
@freezed
class PostModel with _$PostModel{
  factory PostModel({
    required String imageUrl,
    required String text,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String,dynamic> json) => _$PostModelFromJson(json);
}