import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class MediaUtils {
  static Future<File?> compressImage(File imageFile, int maxSizeKB) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // Get the original image file size
    int fileSizeKB = (await imageFile.length()) ~/ 1024;

    // If the original image is already smaller than the target size, return the original file
    if (fileSizeKB <= maxSizeKB) {
      return imageFile;
    }

    // Calculate the compression ratio to achieve the target size
    double compressionRatio = maxSizeKB / fileSizeKB;

    // Compress the image with the calculated ratio
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      imageFile.path,
      minWidth: 1024,
      minHeight: 1024,
      quality: (compressionRatio * 100).round(),
    );

    // Create the compressed file and write the compressed bytes
    File compressedFile = File('$tempPath/${DateTime.now().millisecondsSinceEpoch}.jpg');
    if (compressedBytes != null) {
      compressedFile.writeAsBytesSync(compressedBytes);

      return compressedFile;
    } else {
      return null;
    }
  }
  //
  // static savePdf({required String url}) async {
  //   var file = File('');
  //   var dir;
  //
  //   String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
  //   String fileName = url.split('/').last.replaceAll('.pdf', '');
  //
  //   var status = await Permission.storage.status;
  //   if (status != PermissionStatus.granted) {
  //     status = await Permission.storage.request();
  //   }
  //
  //   try {
  //     if (status.isGranted) {
  //       // Platform.isIOS comes from dart:io
  //       if (Platform.isIOS) {
  //         dir = await getApplicationDocumentsDirectory();
  //       }
  //       if (Platform.isAndroid) {
  //         const downloadsFolderPath = '/storage/emulated/0/Download';
  //         dir = Directory(downloadsFolderPath);
  //       }
  //       String filePath = '${dir.path}/${fileName}_$timestamp.pdf';
  //       file = File(filePath);
  //       final response = await http.get(Uri.parse(url));
  //       final byteData = response.bodyBytes;
  //       try {
  //         await file.writeAsBytes(byteData.buffer.asUint8List());
  //         print('File saved: ${file.path}');
  //         OpenFile.open(filePath);
  //       } on FileSystemException catch (err) {
  //         // handle error
  //         print(err.message.toString());
  //       }
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
