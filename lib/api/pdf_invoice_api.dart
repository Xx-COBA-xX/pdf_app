import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/models/invoice.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    // Simulate a network request
    final pdf = Document();

    // Add page to the PDF
    pdf.addPage(MultiPage(
        build: (context) => [
              buildTitle(invoice),
              SizedBox(height: 0.8 * PdfPageFormat.cm),
            ]));

    final file = await PdfApi.saveDocument(name: 'invoice.pdf', pdf: pdf);

    return file;
  }

  static buildTitle(Invoice invoice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INVOICE",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.8 * PdfPageFormat.cm),
        Text("Description")
      ],
    );
  }
}
