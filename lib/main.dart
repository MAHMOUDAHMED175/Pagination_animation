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
    // if (isLoading)return;
    const limit = 20;
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);
      setState(() {
        //هنا انت بتضيف عنصر عنصر زى كدا ['item 1','item 2' , 'item 3 ']  مينفعش كلهم على بعض فى ليست مره واحده زى كدا  newItems
        page++;
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(newItems.map<String>((e) {
          final title = e['id'];
          return 'title : $title';
        }));
        // (['ddddd','ffff','hhh']);
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
                  title: Text(item),
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
