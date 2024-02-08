import 'Car_Model.dart';

class UserExistsResponse {
  UserExists? userExists;

  UserExistsResponse({this.userExists});

  factory UserExistsResponse.fromJson(Map<String, dynamic> json) {
    final userExistsJson = json['userExists'];
    return UserExistsResponse(
      userExists: userExistsJson != null
          ? UserExists.fromJson(userExistsJson)
          : null,
    );
  }
}

class UserExists {
  String id;
  String firstName;
  String lastName;
  String password;
  String phone;
  String? profileImage;
  String email;
  String? createdAt;
  String? updatedAt;
  int? v;
  Car? cars; // Make it nullable

  UserExists({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
    this.profileImage,
    required this.email,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.cars,
  });

  factory UserExists.fromJson(Map<String, dynamic> json) {
    return UserExists(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      email: json['email'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      cars: json['Cars'] != null ? Car.fromJson(json['Cars']) : null,
    );
  }
}
