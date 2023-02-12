import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/text_field_title.dart';

class TechnicalFormView extends StatelessWidget {
   TechnicalFormView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> issueItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Support'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios),),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const TextFieldTitle(title: 'Name'),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration:  InputDecoration(
                    hintText: 'Please enter your name here',
                    hintStyle:const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffB7B7B7),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:const BorderSide(
                        color: Color(0xFF757575)
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                const TextFieldTitle(title: 'Email'),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration:  InputDecoration(
                    hintText: 'Please enter your email here',
                    hintStyle:const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffB7B7B7),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                const TextFieldTitle(title: 'Issue Topic'),
                const SizedBox(height: 8.0),
                DropdownButtonFormField(
                  decoration:  InputDecoration(
                    hintText: 'Please enter your email here',
                    hintStyle:const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffB7B7B7),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:const BorderSide(
                            color: Color(0xFF757575)
                        )
                    ),
                  ), items: issueItems.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      onTap: (){},
                      child: Text(item),
                    );
                }).toList(), onChanged: (String? value) {  },
                ),
                const SizedBox(height: 16.0),


                const SizedBox(height: 16),
                const TextFieldTitle(title: 'Issue Description'),
                TextFormField(
                  minLines: 5,
                    maxLines: 10,
                    decoration:  InputDecoration(
                      hintText: 'Please enter your email here',
                      hintStyle:const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffB7B7B7),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:const BorderSide(
                              color: Color(0xFF757575)
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:const BorderSide(
                              color: Color(0xFF757575)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:const BorderSide(
                              color: Color(0xFF757575)
                          )
                      ),
                    ),
                ),
                const SizedBox(height: 64),

                FilledButton(onPressed: (){}, child: Text('Submit'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
