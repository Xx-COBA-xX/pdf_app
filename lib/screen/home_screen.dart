import 'package:flutter/material.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/api/pdf_invoice_api.dart';

import '../models/invoice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            final invoice = Invoice(
              supplier: const Supplier(
                name: 'Supplier Name',
                address: 'Supplier Address',
                paymentInfo: 'Supplier Payment Info',
              ),
              customer: const Customer(
                name: 'Customer Name',
                address: 'Customer Address',
              ),
              info: InvoiceInfo(
                date: DateTime.now(),
                dueDate: DateTime.now().add(const Duration(days: 7)),
                description: 'Invoice Description',
                number: '${DateTime.now().year}-9999',
              ),
              items: List.generate(
                5,
                (index) => InvoiceItem(
                  description: 'Some Item',
                  date: DateTime.now(),
                  quantity: index + 1,
                  vat: 0.19,
                  unitPrice: (index + 1) * 10.0,
                ),
              ),
            );
            final pdfFile = await PdfInvoiceApi.generate(invoice);
            PdfApi.openFile(pdfFile);
          },
          child: const Text('Create PDF'),
        ),
      ),
    );
  }
}
