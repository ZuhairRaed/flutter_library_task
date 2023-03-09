import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String path;
  const PdfView({super.key, required this.path});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 25),
        child: SfPdfViewer.network(
          widget.path,
          pageSpacing: 5,
          initialScrollOffset: const Offset(0, 500),
          initialZoomLevel: 0,
        ),
      ),
      floatingActionButton: Container(
        width: 45,
        height: 45,
        child: FloatingActionButton(
          elevation: 50,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xFF075995),
                size: 25,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
