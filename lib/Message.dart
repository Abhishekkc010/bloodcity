import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class MessagePage extends StatefulWidget {
  static String id = 'chat_screen';
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {}
  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(251, 216, 23, 23),
        title: const Text('Detail View'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        List<MessageBubbles> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final currentUser = loggedInUser.email;
          final messageBubble = MessageBubbles(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubbles extends StatelessWidget {
  MessageBubbles(
      {required this.text, required this.sender, required this.isMe});
  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}