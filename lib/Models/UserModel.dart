// class UserModel {
//   final String firstname;
//   final String lastname;
//   final String password;
//   final String phone;
//   final String email;
//
//   UserModel({
//     required this.firstname,
//     required this.lastname,
//     required this.password,
//     required this.phone,
//     required this.email,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       firstname: json['firstname'],
//       lastname: json['lastname'],
//       password: json['password'],
//       phone: json['phone'],
//       email: json['email'],
//     );
//   }
// }

class UserModel {
  final String firstname;
  final String lastname;
  final String password;
  final String phone;
  final String email;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.phone,
    required this.email,
     this.id,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstName'],
      lastname: json['lastName'],
      password: json['password'],
      phone: json['phone'],
      email: json['email'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

}

