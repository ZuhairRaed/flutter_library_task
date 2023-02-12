import 'package:flutter/material.dart';
import 'package:flutter_library_task/models/library_model/library_model.dart';

class LibraryHomeView extends StatelessWidget {
  const LibraryHomeView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<LibraryModel> data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 19,
            top: 21,
            bottom: 20,
          ),
          child: Column(
            children: [
              Row(children: [
                Image.asset('assets/images/Group 1.png'),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                          maxLines: 2,
                          data[index].name.toString(),
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 19,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff075995))),
                    ),
                    Text(data[index].createdAt.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Color(0xff757575))),
                  ],
                )
              ]),
              const Divider()
            ],
          ),
        );
      },
    ));
  }
}
