import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });
  final int id;
  final String name;
  final String status;
  final String image;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, status: $status, image: $image)';
  }
}
