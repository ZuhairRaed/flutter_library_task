// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_library_task/models/tag_model/tag_model.dart';
import 'package:flutter_library_task/state_manage/cubit/home_cubit.dart';

class TagsHomeView extends StatefulWidget {
  const TagsHomeView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<TagModel> data;

  @override
  State<TagsHomeView> createState() => _TagsHomeViewState();
}

class _TagsHomeViewState extends State<TagsHomeView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {});
                BlocProvider.of<HomeCubit>(context).checkId =
                    widget.data[index].id;
              },
              child: widget.data[index].id ==
                      BlocProvider.of<HomeCubit>(context).checkId
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: const Color(0xff009BA6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Center(
                            child: Text(
                          widget.data[index].name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'DIN Next LT W23',
                            fontSize: 15,
                          ),
                        )),
                      ))
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(color: const Color(0xff009BA6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Center(
                            child: Text(
                          widget.data[index].name.toString(),
                          style: const TextStyle(
                            color: Color(0xff009BA6),
                            fontFamily: 'DIN Next LT W23',
                            fontSize: 15,
                          ),
                        )),
                      )),
            ),
          );
        },
      ),
    );
  }
}
