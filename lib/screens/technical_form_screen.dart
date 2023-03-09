import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/text_field_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

class TechnicalFormView extends StatefulWidget {
  const TechnicalFormView({super.key});

  @override
  State<TechnicalFormView> createState() => _TechnicalFormViewState();
}

class _TechnicalFormViewState extends State<TechnicalFormView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // ==== Variabel to set state ===== //
  String name = '';
  String email = '';
  String isseTopic = '';
  String isseTopicDesc = '';
  //  ==== List of items === //
  List<String> items = [
    '1. Incorrect billing or payment amount',
    '2. Broken hyperlink or 404 error messagea',
    '3. Login credentials not reconized or forgotten',
    '4. Slow website loading or server timeouts',
    '5. Unable to access specific website featuers or functionality',
  ];

  // ==============        API TO POST IN HTTP      =============== //
  final apiProvider = Provider((ref) => (String name, String email,
          String issueTopic, String issueDescription) async {
        final response = await http.post(
            Uri.parse('https://development.himam.com/api/technical-support'),
            body: {
              'name': name,
              'email': email,
              'issueTopic': issueTopic,
              'issueDescription': issueDescription,
            });
        return response.statusCode == 200;
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
            Navigator.pop(context);
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

          return Form(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Please enter your name here',
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB7B7B7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const TextFieldTitle(title: 'Email'),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // ==== Email RegEXP==== //

                        final emailRegExp =
                            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        // ignore: unrelated_type_equality_checks
                        if (value != emailRegExp) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Please enter your email here',
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB7B7B7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const TextFieldTitle(title: 'Issue Topic'),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField(
                      isExpanded: true,
                      onChanged: (String? value) {},
                      decoration: InputDecoration(
                        hintText: 'Please enter your email here',
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB7B7B7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                      ),
                      items: items.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      validator: (index) {
                        if (index == null || index.isEmpty) {
                          return 'Please select an item';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        isseTopic = newValue ?? '';
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16),
                    const TextFieldTitle(title: 'Issue Description'),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Problem';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        isseTopicDesc = value;
                      },
                      controller: issueDetailesController,
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Please tell us about your problem',
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB7B7B7),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xFF757575))),
                      ),
                    ),
                    const SizedBox(height: 64),
                    Center(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            fixedSize: const Size(188.0, 45.0),
                            backgroundColor: const Color(0xFF1F2F49),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () async {
                          // =======       Send Data to API       ======= //
                          final api = ref.read(apiProvider);
                          final success = await api(
                              nameController.text,
                              emailController.text,
                              isseTopic,
                              issueDetailesController.text);
                          ref.read(postStateProvider.notifier).state = success
                              ? const AsyncValue<bool>.data(true)
                              : const AsyncValue<bool>.error(
                                  'Failed to post data');
                          // ============ validator ============= //
                          var formdata = formKey.currentState;

                          if (formKey.currentState!.validate()) {
                            formdata?.save();

                            var namePath = ref.watch(nameProvider);
                            namePath = name;
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HomeScreen(
                                        yourName: namePath,
                                      )),
                            );

                            // ============= SnakBar To Notify The User That The Data Sended ========== //

                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: const Color(0xFF075995),
                                content: Center(
                                  child: Text(
                                    ''' Hi  $name  Thank You Your Form Is Submited''',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }
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
