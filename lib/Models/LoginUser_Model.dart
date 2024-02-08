

class LogIn_Model {
  final String? message;
  final String? id;

  final String? error;


  LogIn_Model({this.message,this.error,this.id});

  factory LogIn_Model.fromJson(Map<String, dynamic> json) {
    return LogIn_Model(
      message: json['message'],
      id: json['id'],

      error: json['error'],


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