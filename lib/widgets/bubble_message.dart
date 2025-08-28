import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxWidth: 300),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 22),
            decoration: BoxDecoration(
              color: const Color(0xff8fd2ea),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.person, size: 40),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const Alignment(-100, 0),
                child: Container(
                  color: Colors.transparent,
                  width: 100,
                  child: Text(
                    textAlign: TextAlign.start,
                    message.email.substring(0, message.email.indexOf('@')),
                    style: const TextStyle(
                        fontFamily: 'Libertinus Serif',
                        color: Colors.black,
                        fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: const Color(0xff64a4a9),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(message.message,
                    softWrap: true,
                    style: const TextStyle(
                        fontFamily: 'Libertinus Serif',
                        color: Colors.white,
                        fontSize: 15)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BubbleMessageFriend extends StatelessWidget {
  const BubbleMessageFriend({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxWidth: 300),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                child: Container(
                  color: Colors.transparent,
                  width: 100,
                  child: Text(
                    textAlign: TextAlign.end,
                    message.email.substring(0, message.email.indexOf('@')),
                    style: const TextStyle(
                        fontFamily: 'Libertinus Serif',
                        color: Colors.black,
                        fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffffffff), Color(0xfff9fafc)]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(message.message,
                    softWrap: true,
                    style: const TextStyle(
                        fontFamily: 'Libertinus Serif',
                        color: Colors.black,
                        fontSize: 15)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 22),
            decoration: BoxDecoration(
              color: const Color(0xff8fd2ea),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
