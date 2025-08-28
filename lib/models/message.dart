import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String email;
  final Timestamp time;
  Message({required this.time, required this.message, required this.email});
  factory Message.fromJson(json) {
    return Message(
      message: json['message'],
      email: json['email'],
      time: json['time'],
    );
  }
}
