class MessageModel {
  final String name;
  final String message;
  final String email;

  const MessageModel(
      {required this.name, required this.message, required this.email});

  MessageModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          email: json['email'],
          message: json['message'],
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'message': message,
      };
}
