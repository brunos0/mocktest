import 'dart:convert';

class Pessoa {
  String id;
  String name;
  String avatar;
  String createdAt;

  Pessoa({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'avatar': avatar, 'createAt': createdAt};
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
        id: map['id'],
        name: map['name'],
        avatar: map['avatar'],
        createdAt: map['createdAt']);
  }

  String toJson() => json.encode(toMap());
  factory Pessoa.fromJson(String source) => Pessoa.fromMap(json.decode(source));
}
