// class Buyer {
//   final String firstname;
//   final String lastname;
//   final String password;
//   final String phone;
//   final String email;
//
//   Buyer({
//     required this.firstname,
//     required this.lastname,
//     required this.password,
//     required this.phone,
//     required this.email,
//   });
//
//   factory Buyer.fromJson(Map<String, dynamic> json) {
//     return Buyer(
//       firstname: json['firstname'],
//       lastname: json['lastname'],
//       password: json['password'],
//       phone: json['phone'],
//       email: json['email'],
//     );
//   }
// }

class Buyer {
  final String firstname;
  final String lastname;
  final String password;
  final String phone;
  final String email;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Buyer({
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

  factory Buyer.fromJson(Map<String, dynamic> json) {
    return Buyer(
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

