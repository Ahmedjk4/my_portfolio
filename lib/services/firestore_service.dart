import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/message_model.dart';

class FirestoreService {
  static Future<void> addMessage(MessageModel message) async {
    final messageRef = FirebaseFirestore.instance
        .collection('messages')
        .withConverter<MessageModel>(
          fromFirestore: (snapshot, _) =>
              MessageModel.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson(),
        );

    await messageRef.add(message);
  }
}
