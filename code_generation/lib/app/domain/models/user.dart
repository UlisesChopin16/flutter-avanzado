import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
// part 'user.freezed.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final int id;

  // @JsonKey(defaultValue: 18)
  // final int? age; // si no queremos que el valor sea nulo le agregamos el default value

  final String username;
  // fromJson sirve para nos entregue los subcampos de un json
  // @JsonKey(fromJson: _avatarFromJson) // esta linea sirve para que el json sepa que el campo avatar es un json y no un string
  // y que se debe llamar a la funcion _avatarFromJson para obtener el valor

  // readValur sirve para leer el JSON completo y obtener el valor de un campo especifico
  @JsonKey(readValue: _readAvatar)
  final String avatar;

  // por ejemplo supongamos que el campo Hash es una convinacion entre el campo username y el campo id
  // entonces en este caso se usa el readValue para leer el json completo y obtener el valor de los campos username y id
  // @JsonKey(readValue: _readHash)
  // final String hash;

  // final DateTime birthday;

  // final UserType type;

  final List<Occupation> occupations;

  User({
    required this.id,
    required this.username,
    required this.avatar,
    required this.occupations,
    // required this.hash,
    // required this.birthday,
    // required this.type,
    // this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? username,
    String? avatar,
    List<Occupation>? occupations,
    // String? hash,
    // int? age,
    // DateTime? birthday,
    // UserType? type,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        occupations: occupations ?? this.occupations,
        // hash: hash ?? this.hash,
        // age: age ?? this.age,
        // birthday: birthday ?? this.birthday,
        // type: type ?? this.type,
      );
}

// enum UserType {
//   @JsonValue(1)
//   admin,
//   @JsonValue(0)
//   normal,
// }

// String _readHash(Map json, String _) {
//   String username = json['username'];
//   int id = json['_id'];
//   return '$username$id';
// }

String _readAvatar(Map json, String key) {
  String path = json['avatar']['tmdb']['avatar_path'];
  return path;
}

// String _avatarFromJson(Map<String, dynamic> data) {
//   String path = data['tmdb']['avatar_path'];
//   return path;
// }

@JsonSerializable()
class Occupation {
  final int id;
  final String name;

  Occupation({
    required this.id,
    required this.name,
  });

  factory Occupation.fromJson(Map<String, dynamic> json) =>
      _$OccupationFromJson(json);
}
