import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_task/models/tag.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Library'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = 'test'}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tag> _tabs = [];
  Map<String, List<dynamic>> _tabData = {};

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    var dio = Dio();
    final response =
        await dio.get('https://development.himam.com/api/library/tags');
    final data = json.decode(response.data) as List;

    List<Tag> tabs = [];
    Map<String, List<dynamic>> tabData = {};

    for (var tag in data) {
      Tag tg = new Tag(
          id: tag['id'],
          name: tag['name'],
          createdAt: tag['createdAt'],
          updatedAt: tag['updatedAt']);

      tabs.add(tg);
    }

    setState(() {
      _tabs = tabs;
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 21, left: 25),
          child: Text(
            'Library',
            style: TextStyle(
              color: Color(0xff075995),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ScrollableListTabView(
        tabHeight: 48,
        tabs: [
          ScrollableListTab(
              tab: ListTab(
                  label: Text('Transelations'),
                  borderRadius: BorderRadius.circular(45),
                  activeBackgroundColor: Color(0xff009BA6),
                  inactiveBackgroundColor: Colors.white),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, index) => ListTile(
                  leading: Container(
                    height: 45,
                    width: 32.97,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //C:\Users\Admin\Desktop\flutter_library_task\assets\fonts\img\Group.png
                        image: AssetImage("assets/fonts/img/Group.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(
                    'List element',
                    style: TextStyle(color: Color(0xff075995)),
                  ),
                  subtitle: Text('Added 12 November, 2021'),
                ),
              )),
        ],
      ),
    );
  }
}
