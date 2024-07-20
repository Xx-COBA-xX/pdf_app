import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// ignore: implementation_imports
import 'package:pdf/src/widgets/document.dart';

class PdfApi {
  static Future<void> openFile(File file) async {
    // Open the PDF file in the default PDF viewer
    final url = file.path;

    await OpenFile.open(url);
  }

  static saveDocument({required String name, required Document pdf}) async {
    // Save the document
    final byte = await pdf.save();
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(byte);
    return file;
  }
}


