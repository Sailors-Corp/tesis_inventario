import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('simple')
  simple,

  @JsonValue('multiple')
  more;

  const Role();

  static Role getByName(String name) => switch (name) {
        'administrador' => Role.simple,
        (_) => Role.more,
      };

  @override
  String toString() => switch (this) {
        Role.simple => 'administrador',
        Role.more => 'dependiente',
      };
}
