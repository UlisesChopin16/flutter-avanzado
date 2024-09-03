// import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user.g.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    @JsonKey(readValue: _readAvatar) 
    required String avatar,
    @Default(0) int? age,
    required List<Occupation> occupations,
  }) = _User;

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
} 

@freezed
class Occupation with _$Occupation {
  const factory Occupation({
    required int id,
    required String name,
  }) = _Occupation;

  factory Occupation.fromJson(Map<String, dynamic> json) => _$OccupationFromJson(json);
}


String _readAvatar(Map<dynamic, dynamic> json, String key) {
  String path = json[key]['tmdb']['avatar_path'];
  return path;
}
