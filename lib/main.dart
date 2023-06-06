import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const Pagination());
  }
}

class Pagination extends StatefulWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List<String> items = [];

  // List.generate(20, (index) => 'Item ${index + 1}');

  final controller = ScrollController();
  bool hasMore = true;
  int page = 1;

  @override
  void initState() {
    super.initState();

    fetch();
    controller.addListener(() {
      //يعتبر maxScrollExtent هو القيمة القصوى للانتقال في عنصر التحكم، أي أقصى قيمة يمكن أن يتم التمرير إليها. و offset يُشير إلى الموضع الحالي للتمرير داخل عنصر التحكم.
      //بيقلك كدا احنا فى اخر الليست

      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }


  Future fetch() async {
    const limit = 8;
    final url = Uri.parse(
      'https://dummyjson.com/products?limit=$limit&skip=$page',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body)['products'];
      setState(() {
        page++;
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(newItems.map<String>((e) {
          final title = e['title'];
          return 'title : $title';
        }));

        // Extract and store the image URLs
        images.addAll(newItems.map<String>((e) {
          final imagesList = e['images'];
          // Assuming the first image in the list is the desired one
          final imageUrl = imagesList.isNotEmpty ? imagesList[0] : '';
          return imageUrl;
        }));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  Future refresh() async {
    setState(() {
      hasMore = true;
      page = 1;
      items.clear();
    });
    fetch();
  }
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(20),
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];
                return ListTile(
                  title: Column(
                    children: [
                      Text(item),
                      Image.network(images[index]),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: hasMore
                        ? const CupertinoActivityIndicator(radius: 40)
                        : const Text('No More Data'),
                  ),
                );
              }
            }),
      ),
    );
  }
}
