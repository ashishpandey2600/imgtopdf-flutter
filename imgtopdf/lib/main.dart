import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:imgtopdf/mobile.dart';
import 'dart:io';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ImgToPdf")),
      body: Center(
        child: ElevatedButton(
          onPressed:
         _createPDF,
          child: Text("create pdf",),
          
        ),
      ),
    );
  }

  // function for creating the pdf
  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    document.pages.add();

    List<int> bytes =await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
