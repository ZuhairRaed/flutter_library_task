import 'package:flutter/material.dart';
import 'package:flutter_library_task/variabels/library.dart';
import 'package:flutter_library_task/widgets/text_field_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'library_screen.dart';

class TechnicalFormView extends StatefulWidget {
  const TechnicalFormView({super.key});

  @override
  State<TechnicalFormView> createState() => _TechnicalFormViewState();
}

class _TechnicalFormViewState extends State<TechnicalFormView> {
  //--------------// ===  Form key  === //----------------//
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSending = false;
  // ==== Variabel to set state ===== //
  String name = '';
  String email = '';
  String isseTopics = '';
  String isseTopicDesc = '';
  //  ==== List of items === //
  List<String> items = [
    ' Incorrect billing or payment amount',
    ' Broken hyperlink or 404 error messagea',
    ' Login credentials not reconized or forgotten',
    ' Slow website loading or server timeouts',
    ' Unable to access specific website featuers or functionality',
  ];

  // ==============        API TO POST IN HTTP      =============== //
  final apiProvider = Provider((ref) => (String name, String email,
          String issueTopic, String issueDescription) async {
        try {
          final response = await http.post(
            Uri.parse("https://development.himam.com/api/technical-support"),
            body: {
              'name': name,
              'email': email,
              'issueTopic': issueTopic,
              'issueDescription': issueDescription,
            },
          );
          return true;
        } catch (e) {
          print('Error occurred while making API call: $e');
          return false;
        }
      });
  // ======== Providers ======= //
  final postStateProvider =
      StateProvider((ref) => const AsyncValue<bool>.data(false));
  final selectedOptionProvider = StateProvider<String?>((ref) => null);
  final nameProvider = StateProvider<String>((ref) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF075995)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Technical Support",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 20, color: Color(0xFF075995)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LibraryScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          // ===   controllers   === //
          final nameController = TextEditingController();
          final emailController = TextEditingController();
          final issueDetailesController = TextEditingController();

          // ===   Get Provider to return sucess message === //
          final postState = ref.watch(postStateProvider);

          return isSending
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextFieldTitle(title: 'Name'),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            validator: FormBuilderValidators.required(),
                            onChanged: (newValue) {
                              name = newValue;
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: ' Please enter your name here',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB7B7B7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const TextFieldTitle(title: 'Email'),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(
                                  errorText: "Please Enter Valid Email")
                            ]),
                            onChanged: (value) {
                              email = value;
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: ' Please enter your email here',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB7B7B7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const TextFieldTitle(title: 'Issue Topic'),
                          const SizedBox(height: 8.0),
                          DropdownButtonFormField(
                            isExpanded: true,
                            validator: FormBuilderValidators.required(),
                            onChanged: (String? value) {
                              isseTopics = value!;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              hintText: ' Select the issue topic',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB7B7B7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                            ),
                            items: items.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16.0),
                          const SizedBox(height: 16),
                          const TextFieldTitle(title: 'Issue Description'),
                          TextFormField(
                            validator: FormBuilderValidators.required(),
                            controller: issueDetailesController,
                            minLines: 5,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: ' Please tell us about your problem',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB7B7B7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF757575))),
                            ),
                          ),
                          const SizedBox(height: 76),
                          Center(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                  fixedSize: const Size(188.0, 45.0),
                                  backgroundColor: const Color(0xFF1F2F49),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  // =======       Send Data to API       ======= //
                                  setState(() {
                                    isSending = true;
                                  });

                                  final api = ref.read(apiProvider);
                                  api(
                                    nameController.text,
                                    emailController.text,
                                    isseTopics,
                                    issueDetailesController.text,
                                  ).then((value) {
                                    ref.read(postStateProvider.notifier).state =
                                        value
                                            ? const AsyncValue<bool>.data(true)
                                            : const AsyncValue<bool>.error(
                                                'Failed to post data');

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xFF075995),
                                        content: Center(
                                            child:
                                                Text("Your From Is Submitted")),
                                      ),
                                    );
                                    String namePath = ref.watch(nameProvider);
                                    namePath = nameController.text;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeScreen(
                                          yourName: namePath,
                                        ),
                                      ),
                                    );
                                  }).catchError((error) {
                                    print(
                                        'Error occurred while making API call: $error');
                                    ref.read(postStateProvider.notifier).state =
                                        const AsyncValue<bool>.error(
                                            'Failed to post data');
                                  });

                                  // ============= SnakBar To Notify The User That The Data Sended ========== //
                                } else {
                                  formKey.currentState?.save();
                                }
                                // ============ Validator End ============= //
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          // ==== To Show Error If there is Problem ====== //
                          postState.when(
                            loading: () => const CircularProgressIndicator(),
                            error: (error, stackTrace) =>
                                const Center(child: Text('')),
                            data: (success) =>
                                Text(success ? 'Data posted successfully' : ''),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
