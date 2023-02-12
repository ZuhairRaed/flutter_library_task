import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key, required this.fileUrl}) : super(key: key);

  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
          fileUrl),
    );
  }
}
