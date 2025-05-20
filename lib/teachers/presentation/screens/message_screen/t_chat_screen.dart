import 'package:flutter/material.dart';

class TChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      "text":
          "Hi Ayisha khan, I’ve reviewed the homework update. Everything looks good.",
      "isMe": false,
    },
    {
      "text": "Thank you. I will update the class record accordingly",
      "isMe": true,
    },
    {
      "text":
          "Hi Ayisha khan, I’ve reviewed the homework update. Everything looks good.",
      "isMe": false,
    },
    {
      "text":
          "Hi Ayisha khan, I’ve reviewed the homework update. Everything looks good.",
      "isMe": false,
    },
    {
      "text": "Thank you. I will update the class record accordingly",
      "isMe": true,
    },
    {
      "text":
          "Hi Ayisha khan, I’ve reviewed the homework update. Everything looks good.",
      "isMe": false,
    },
    {
      "text": "Thank you. I will update the class record accordingly",
      "isMe": true,
    },
    {
      "text":
          "Hi Ayisha khan, I’ve reviewed the homework update. Everything looks good.",
      "isMe": false,
    },
  ];

  TChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      // appBar: AppBar(title: const Text("Chat"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFDF0E7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 15),
                    CircleAvatar(),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Ayisha Khan'), Text('Maths teacher')],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return Align(
                    alignment:
                        msg["isMe"]
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      decoration: BoxDecoration(
                        color:
                            msg["isMe"] ? Color(0xFFEE742A) : Color(0xFFFDF0E7),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(msg["isMe"] ? 16 : 0),
                          bottomRight: Radius.circular(msg["isMe"] ? 0 : 16),
                        ),
                      ),
                      child: Text(
                        msg["text"],
                        style: TextStyle(
                          color: msg["isMe"] ? Colors.white : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // const Divider(height: 1),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFFDF0E7),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Color(0xFFEE742A),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
