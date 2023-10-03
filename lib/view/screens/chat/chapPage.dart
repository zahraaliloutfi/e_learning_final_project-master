import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late User _user;
  String _messageText = '';

  @override
  void initState() {
    super.initState();

    _getCurrentUser();
    getMessageNotification();
  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        _user = user;
      }
      await FirebaseMessaging.instance.subscribeToTopic('chat');
    } catch (e) {
      print(e);
    }
  }

  getMessageNotification() {
    _firebaseMessaging.getToken().then((token) {
      print("=================================================");
      print(token);
    });
    FirebaseMessaging.onMessage.listen((event) {
      print("===================notification=================");
      print("${event.notification?.title}");
      print("${event.notification?.body}");
      Navigator.of(context).pushNamed("/ChatScreen");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("===================notification=================");
      print("${event.notification?.title}");
      print("${event.notification?.body}");
      Navigator.of(context).pushNamed("ChatScreen");
    });
  }

  void _sendMessage() async {
    if (_messageText.isNotEmpty) {
      try {
        await _firestore.collection('messages').add({
          'text': _messageText,
          'sender': _user.email,
          'timestamp': FieldValue.serverTimestamp(),
        });
        // Clear the text field after sending the message
        setState(() {
          _messageText = '';
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.kPrimaryColorBlue,
        title: Text(
          'Group Chat ',
          style: TajwalRegular.copyWith(
            color: ColorResources.kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 23.sp,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('messages')
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator(
                  color: ColorResources.kPrimaryColorOrange,
                );
              }
              final messages = snapshot.data?.docs.reversed;
              List<MessageBubble> messageWidgets = [];
              for (var message in messages!) {
                final messageText = message['text'];
                final messageSender = message['sender'];
                final currentUser = _user.email;

                final messageBubble = MessageBubble(
                  text: messageText,
                  sender: messageSender,
                  isMe: currentUser == messageSender,
                );

                messageWidgets.add(messageBubble);
              }
              return Expanded(
                child: ListView(
                  reverse: true,
                  children: messageWidgets,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _messageText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: ColorResources.kPrimaryColorblack,
                  ),
                  onPressed: () async {
                    _sendMessage();
                    await sendNotification("new message",
                        "${_user.email} sent a message", "${_user.uid}");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String? text;
  final String? sender;
  final bool? isMe;

  MessageBubble({this.text, this.sender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender!.split('@')[0] ?? "",
            style: TajwalRegular.copyWith(
              color: ColorResources.textColor(context),
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: isMe! ? ColorResources.kPrimaryColorBlue : Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color:
                      isMe! ? ColorResources.kPrimaryColorGrey : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var serverToken = "AIzaSyCLqVlrjyhOFA7W2Y5IlMcghnb0O8JtbHM";
sendNotification(String title, String body, String id) async {
  await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=${serverToken}',
      },
      body: jsonEncode(<String, dynamic>{
        'notification': <String, dynamic>{
          'body': body.toString(),
          'title': title.toString(),
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': id.toString(),
        },
        'to': "/topics/chat"
      }));
}
