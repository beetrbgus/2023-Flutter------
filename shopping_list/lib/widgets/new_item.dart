import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 아이템 추가'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Text("더미 폼"),
      ),
    );
  }
}
