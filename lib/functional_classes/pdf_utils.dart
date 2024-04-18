import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:http/http.dart' as http;

class PdfUtils {
  Future<File> pdfToImage(File pdf) async {
    final doc = await PdfDocument.openFile(pdf.path);
    final page = await doc.getPage(1);
    final pageImage = await page.render();

    final image = await pageImage.createImageDetached();
    final pngData = await image.toByteData(format: ui.ImageByteFormat.png);

    return writeToFile(pngData!, getPdfName(pdf.path));
  }

  String getPdfName(String pdfString) {
    // Check if the string represents a file path
    if (pdfString.startsWith('file://')) {
      final file = File(pdfString.substring(7)); // Remove 'file://' prefix
      final fileName = file.path.split('/').last; // Extract the file name
      return fileName.replaceAll('.pdf', ''); // Remove the '.pdf' extension
    }

    // Check if the string represents a network URL
    if (pdfString.startsWith('http://') || pdfString.startsWith('https://')) {
      final uri = Uri.parse(pdfString);
      final fileName = uri.pathSegments.last; // Extract the file name from the URL
      return fileName.replaceAll('.pdf', ''); // Remove the '.pdf' extension
    }

    return ''; // Return an empty string if the format is not recognized
  }

  Future<File> networkPdfToImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final documentBytes = response.bodyBytes;
    final document = await PdfDocument.openData(documentBytes);

    final page = await document.getPage(1);
    final pageImage = await page.render();

    final image = await pageImage.createImageDetached();
    final pngData = await image.toByteData(format: ui.ImageByteFormat.png);

    return writeToFile(pngData!, getPdfName(url));
  }

  Future<File> writeToFile(ByteData data, String fileName) async {
    final uint8List = data.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    final filePath = '${tempDir.path}/${fileName}_$timestamp.png';
    final file = File(filePath);

    await file.writeAsBytes(uint8List);
    return file;
  }

  Future<File?> getFile(File? file) async {
    if (file == null) return null;

    if (file.path.split('.').last != 'pdf') {
      return file;
    } else {
      return pdfToImage(file);
    }
  }
}
