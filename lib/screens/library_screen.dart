import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_task/classes/library.dart';
import 'package:flutter_library_task/classes/tags.dart';
import 'package:flutter_library_task/widgets/filter_container.dart';
import 'package:flutter_library_task/widgets/list_item.dart';
import 'package:flutter_library_task/widgets/poppins_text.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  Future<List<Library>> fetchLibrary() async{
    var response = await Dio().get('https://development.himam.com/api/library');
    print(response.runtimeType);
    var t  = response.data as List<dynamic>;
    return t.map((e) => Library.fromJson(e)).toList();
  }

  Future<List<Tags>> fetchTags() async{
    var response = await Dio().get('https://development.himam.com/api/library/tags');
    var t  = response.data as List<dynamic>;
    return t.map((e) => Tags.fromJson(e)).toList();
     
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: fetchLibrary(),
            builder: (context, snapshot) {
        
              print( "ahmad $snapshot");
              if (snapshot.hasData) {
                return Container(
              height: screenHeight,
              width: screenWidth,
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20), child: PoppinsText(text: "Library", size: 20, color: Color(0xff075995),fontWeight: FontWeight.w400,)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        FilterContainer(text: "Translated Articles", isSelected: true),
                        FilterContainer(text: "Audio & Visual Gallery", isSelected: false),
                        FilterContainer(text: "Spotlights", isSelected: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
          
                  
        
                  Container(
                    height: screenHeight * 0.8,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListItem(description: (snapshot.data?[index] as Library).createdAt!, title: (snapshot.data?[index] as Library).name!,icon: (snapshot.data?[index] as Library).id!,),
                          Divider(),
                        ],
                      );
                    },),
                  )
                ],
              ),
            );
              }
              else{ return  const CircularProgressIndicator();}
            },
          ),
        ),
      ),
    );
  }
}
