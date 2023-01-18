import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const AuthorModel._();
  factory AuthorModel(
    int id,
    String picture,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
  ) = _AuthorModel;

  String get name {
    return '$firstName $lastName';
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}

// @JsonSerializable()
// class AuthorModel {
//   const AuthorModel({
//     required this.id,
//     required this.picture,
//     required this.firstName,
//     required this.lastName,
//   });

//   final int id;

//   final String picture;
//   @JsonKey(name: 'first_name')
//   final String firstName;
//   @JsonKey(name: 'last_name')
//   final String lastName;

//   String get name {
//     return '$firstName $lastName';
//   }

//   factory AuthorModel.fromJson(Map<String, dynamic> json) =>
//       _$AuthorModelFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
// }
