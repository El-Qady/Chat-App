import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/bubble_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String routeName = 'ChatView';
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  List<Message> messagesList = [];
  String? message;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String user = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            messagesList.clear();
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              DocumentSnapshot doc = snapshot.data!.docs[i];
              messagesList.add(Message.fromJson(doc.data()));
            }
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 207, 230, 246),
              appBar: AppBar(
                elevation: 1,
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xff8fd2ea),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 45,
                      opacity: const AlwaysStoppedAnimation(0.35),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Chat View',
                      style: TextStyle(
                        fontFamily: 'Libertinus Serif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) =>
                          messagesList[index].email == user
                              ? BubbleMessage(
                                  message: messagesList[index],
                                )
                              : BubbleMessageFriend(
                                  message: messagesList[index],
                                ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextField(
                              controller: controller,
                              onChanged: (value) {
                                message = value;
                              },
                              onSubmitted: (value) {
                                messages.add({
                                  "message": message,
                                  "time": DateTime.now(),
                                  'email': user
                                });
                                controller.clear();
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (_controller.hasClients) {
                                    _controller.animateTo(
                                      0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Type a message',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            messages.add({
                              "message": message,
                              "time": DateTime.now(),
                              'email': user
                            });
                            controller.clear();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (_controller.hasClients) {
                                _controller.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xff8fd2ea),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.send,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
