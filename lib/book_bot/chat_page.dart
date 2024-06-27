import 'package:books_demo/book_bot/sections/chat.dart';
import 'package:books_demo/book_bot/sections/chat_stream.dart';
import 'package:books_demo/book_bot/sections/embed_batch_contents.dart';
import 'package:books_demo/book_bot/sections/embed_content.dart';
import 'package:books_demo/book_bot/sections/response_widget_stream.dart';
import 'package:books_demo/book_bot/sections/stream.dart';
import 'package:books_demo/book_bot/sections/text_and_image.dart';
import 'package:books_demo/book_bot/sections/text_only.dart';
import 'package:books_demo/constants/constants.dart';
import 'package:flutter/material.dart';

class SectionItem {
  final int index;
  final String title;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedItem = 0;

  final _sections = <SectionItem>[
    SectionItem(0, 'Stream text', const SectionTextStreamInput()),
    SectionItem(1, 'textAndImage', const SectionTextAndImageInput()),
    SectionItem(2, 'chat', const SectionChat()),
    SectionItem(3, 'Stream chat', const SectionStreamChat()),
    SectionItem(4, 'text', const SectionTextInput()),
    SectionItem(5, 'embedContent', const SectionEmbedContent()),
    SectionItem(6, 'batchEmbedContents', const SectionBatchEmbedContents()),
    SectionItem(
        7, 'response without setState()', const ResponseWidgetSection()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white, // Change this to your desired color
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: primaryColor,
        title: Text(
          _selectedItem == 0
              ? 'Bookly:Ask me about Books!'
              : _sections[_selectedItem].title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        // actions: [
        //   PopupMenuButton<int>(
        //     initialValue: _selectedItem,
        //     onSelected: (value) => setState(() => _selectedItem = value),
        //     itemBuilder: (context) => _sections.map((e) {
        //       return PopupMenuItem<int>(value: e.index, child: Text(e.title));
        //     }).toList(),
        //     child: const Icon(Icons.more_vert_rounded),
        //   )
        // ],
      ),
      body: IndexedStack(
        index: _selectedItem,
        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}
