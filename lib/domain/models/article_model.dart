import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  factory ArticleModel(
    int id,
    @JsonKey(name: 'author_id') int authorId,
    String content,
  ) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

// @JsonSerializable()
// class ArticleModel {
//   const ArticleModel({
//     required this.id,
//     required this.authorId,
//     required this.content,
//   });

//   //gdy key z backednu ma taką samą nazwę nie musimy definiować JsonKey
//   //usunięte bo takie same @JsonKey(name: 'id')
//   final int id;

//   //tutaj się różni więc musi zostać
//   @JsonKey(name: 'author_id')
//   final int authorId;

//   //@JsonKey(name: 'content')
//   final String content;

//   factory ArticleModel.fromJson(Map<String, dynamic> json) =>
//       _$ArticleModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
// }
