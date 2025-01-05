import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class SimplePage extends StatefulWidget {
  const SimplePage({super.key});

  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  int maxContentCount = 50;

  List<String> _items = [];

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(
      () {
        //   check if user scrolled to the end of the list
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (_items.length < maxContentCount) {
            getMoreItems(_items.length);
          }
        }
      },
    );
    _items = List.generate(20, (index) => "Data - ${index + 1}");

    super.initState();
  }

  // new data
  Future<void> getMoreItems(int size) async {
    Future.delayed(const Duration(seconds: 3));

    List<String> newData =
        List.generate(5, (index) => "Data - ${size + index + 1}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._items.asMap().entries.map((e) {
                int index = e.key;
                String item = e.value;

                if (index < _items.length) {
                  log("Index - $index");
                  return Card(
                    child: ListTile(
                      title: Text(item),
                    ),
                  );
                } else {
                  return _items.length <= maxContentCount
                      ? CircularProgressIndicator()
                      : SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
