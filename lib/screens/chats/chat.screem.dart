import 'package:emart/consts/consts.dart';
import 'package:emart/screens/chats/components/senderBubble.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: "Ameer Hamza".text.make(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          )),
      body: Container(
        color: whiteColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    color: whiteColor,
                    child: ListView(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: senderBubble("hi i am sender and you", true),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: senderBubble("Hi i am receiver and you", false),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: senderBubble("Hi i am receiver and you", false),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: senderBubble("Hi i am receiver and you", false),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: senderBubble("hi i am sender and you", true),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: senderBubble("hi i am sender and you", true),
                      ),
                    ]))),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Typing ..........",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: textfieldGrey,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: primaryColor,
                        ))),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: primaryColor,
                      size: 30,
                    ))
              ],
            )
                .box
                .height(70)
                .padding(const EdgeInsets.all(10))
                .margin(const EdgeInsets.only(bottom: 10))
                .make()
          ],
        ),
      ),
    );
  }
}
