import 'UserModel.dart';

class SignUp_Model {
  final String? message;
  final UserModel? savedUser;

  final String? error;

  SignUp_Model({this.message, this.error,this.savedUser});



  factory SignUp_Model.fromJson(Map<String, dynamic> json) {
    return SignUp_Model(
      message: json['message'],
      error: json['error'],
      savedUser: UserModel.fromJson(json['savedUser']),



    );
  }
  Map<String, dynamic> toJson() {
    if (error != null) {
      return {
        'error': error,
      };
    } else if (message != null) {
      return {
        'message': message,
      };
    } else {
      throw Exception("UserResponse should have either 'message' or 'error'.");
    }
  }
}