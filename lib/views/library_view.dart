import 'package:flutter/material.dart';
import 'package:flutter_library_task/view_model/library_view_model.dart';
import 'package:flutter_library_task/views/pdf_viewer.dart';
import 'package:provider/provider.dart';
import '../models/library_data_model.dart';
import '../models/library_tags_model.dart';
import 'technical_form_view.dart';
import 'package:intl/intl.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<LibraryViewModel>(context, listen: false)
          .getLibraryTags(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Consumer<LibraryViewModel>(
      builder: (BuildContext context, LibraryViewModel libraryProvider, _) {
        final List<LibraryDataModel>? libraryDataByTag =
            libraryProvider.libraryData[libraryProvider.selectedTag + 1];
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Library',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.support_agent),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  TechnicalFormView()));
                },
              ),
            ],
          ),
          body: !libraryProvider.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: libraryProvider.libraryTags.length,
                          itemBuilder: (BuildContext context, int i) {
                            LibraryTagsModel tag =
                                libraryProvider.libraryTags[i];
                            return Container(
                              height: 23.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InputChip(
                                labelPadding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 14.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45.0),
                                ),
                                side: libraryProvider.selectedTag != i
                                    ? BorderSide(
                                        color: theme.colorScheme.primary)
                                    : null,
                                showCheckmark: false,
                                selectedColor: const Color(0xFF009BA6),
                                label: Text(
                                  tag.name!,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: libraryProvider.selectedTag == i
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                    color: libraryProvider.selectedTag == i
                                        ? Colors.white
                                        : theme.colorScheme.primary,
                                  ),
                                ),
                                selected: libraryProvider.selectedTag == i,
                                onSelected: (bool selected) {
                                  libraryProvider.setSelectedTag = i;
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: libraryDataByTag!.length,
                        itemBuilder: (BuildContext context, int i) {
                          LibraryDataModel libraryDataModel =
                              libraryDataByTag[i];
                          return ListTile(
                            title: Text(
                              libraryDataModel.name!,
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: theme.colorScheme.primary),
                            ),
                            subtitle: Text(
                              DateFormat('dd MMMM, yyyy').format(
                                  DateTime.parse(libraryDataModel.createdAt!)),
                              style: const TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 16.0,
                              ),
                            ),
                            leading: Image.asset('assets/images/pdf.png'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PdfViewer(
                                      fileUrl: libraryDataModel.media!.url!),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const Divider(
                            indent: 16.0,
                            endIndent: 16.0,
                            color: Color(0xFFEBEBEB),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
