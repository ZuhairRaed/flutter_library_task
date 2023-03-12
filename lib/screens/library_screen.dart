// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_library_task/api/services.dart';
import 'package:flutter_library_task/api/services_modle.dart';
import 'package:flutter_library_task/newScreen/pdf_view.dart';
import 'package:flutter_library_task/screens/technical_form_screen.dart';
import 'package:flutter_library_task/variabels/library.dart';
import 'package:flutter_library_task/variabels/tags.dart';

import 'home_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
//=============== Filter the items ===============//

  ProviderFamily<List<Library>, int> filteredItemsProvider =
      Provider.family<List<Library>, int>((ref, id) {
    List<Library> items = ref.watch(libraryDataProvider).value ?? [];
    return items.where((item) => item.tagId == id).toList();
  });

  StateProvider<int> selectedListProvider = StateProvider<int>((ref) => 1);
  StateProvider<String> getUrlProvider = StateProvider<String>((ref) => '');

//========= selected container ==========//

  int selectedContainer = 0;

  void onContainerTapped(int index) {
    setState(() {
      selectedContainer = index;
    });
  }
//============= image check ==============//

  @override
  void initState() {
    // Call super.initState() to perform the default initialization.
    super.initState();
    // Perform any other initialization you need here.
    // For example, you might want to initialize some variables or fetch data.
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      // ==============    to watch the tags data       ===============//
      final tagsData = ref.watch(tagsDataProvider);
      return Scaffold(
        body: tagsData.when(
            data: (tagsData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 41,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            right: 150,
                            left: 45,
                          ),
                          child: const Text(
                            "Library",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 25,
                                color: Color(0xff009BA6)),
                          ),
                        ),
                        const SizedBox(
                          width: 31,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const TechnicalFormView()));
                            },
                            icon: const Icon(
                              Icons.headset_mic_rounded,
                              color: Color(0xff009BA6),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: tagsData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                onContainerTapped(index);
                                ref.read(selectedListProvider.notifier).state =
                                    tagsData[index].id!;
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                    color: selectedContainer == index
                                        ? const Color(0xff009BA6)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(35),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color(0xff009BA6))),
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    onContainerTapped(index);
                                    ref
                                        .read(selectedListProvider.notifier)
                                        .state = tagsData[index].id!;
                                  },
                                  child: Text(
                                    "${tagsData[index].name}",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      color: selectedContainer == index
                                          ? const Color(0xffFFFFFF)
                                          : const Color(0xff009BA6),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(child: Consumer(builder: (context, ref, child) {
                      // Providers //

                      var filePath = ref.watch(getUrlProvider);
                      final selectedColor =
                          ref.watch(selectedListProvider.notifier).state;
                      final filterditems =
                          ref.watch(filteredItemsProvider(selectedColor));
                      final asyncLibraryList =
                          AsyncValue<List<Library>>.data(filterditems);

                      // =======  Return The Data ==== //

                      return asyncLibraryList.when(
                          data: (asyncLibraryList) {
                            return ListView.builder(
                              itemCount: asyncLibraryList.length,
                              itemBuilder: (BuildContext context, index) {
                                filePath =
                                    "${asyncLibraryList[index].media?.url}";
                                return InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PdfView(
                                                path: filePath,
                                              )),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                          title: Text(
                                            "${asyncLibraryList[index].media?.fileName}",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 19,
                                                color: Color(0xFF075995)),
                                          ),
                                          subtitle: Text(
                                            DateFormat('dd MMMM, yyyy').format(
                                                DateTime.parse(
                                                    "${asyncLibraryList[index].createdAt}")),
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Color(0xFF757575)),
                                          ),
                                          leading: Image.asset(
                                            asyncLibraryList[index]
                                                        .media
                                                        ?.type ==
                                                    'FILE'
                                                ? "assets/images/pdf.png"
                                                : asyncLibraryList[index]
                                                            .media
                                                            ?.type ==
                                                        'VIDEO'
                                                    ? 'assets/images/video.png'
                                                    : 'assets/images/doc.png',
                                          )),
                                      const Divider(
                                        thickness: 1,
                                        color: Color(0xFFEBEBEB),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          error: (err, s) => Text(err.toString()),
                          loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ));
                    })),
                  ],
                ),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      );
    });
  }
}
