import 'dart:io';

import 'package:ct_app/constants/constants.dart';
import 'package:ct_app/constants/custom_icon_data.dart';
import 'package:ct_app/functional_classes/media_utils.dart';
import 'package:ct_app/functional_classes/pdf_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseFileContainer extends StatefulWidget {
  final double? minHeight;
  const ChooseFileContainer({super.key, this.minHeight});

  @override
  State<ChooseFileContainer> createState() => _ChooseFileContainerState();
}

class _ChooseFileContainerState extends State<ChooseFileContainer> {
  final _picker = ImagePicker();
  File? _attachment;

  _showFileSelectionBottomSheet() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDestructiveAction: true,
          child: const Text('Cancel'),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text(
              'Choose from Gallery',
              style: TextStyle(color: Constants.primary_color),
            ),
            onPressed: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _attachment = File(image.path);
                });
                Navigator.pop(context);
              }
            },
          ),
          CupertinoActionSheetAction(
            child: const Text(
              'Choose from Files',
              style: TextStyle(color: Constants.primary_color),
            ),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
              );
              if (result != null) {
                File? fileForUpload = File(result.files.single.path!);
                if (fileForUpload.path.split('.').last != "pdf") {
                  fileForUpload = await MediaUtils.compressImage(fileForUpload, 1000);
                }
                setState(() {
                  _attachment = fileForUpload;
                });
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showFileSelectionBottomSheet,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.maxFinite,
        constraints: BoxConstraints(minHeight: widget.minHeight ?? 0),
        decoration: BoxDecoration(
          color: Constants.secondary_color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _attachment == null
            ? const Column(children: [
                Icon(CustomIconData.add_square, size: 24, color: Constants.primary_color),
                SizedBox(height: 8),
                Text('Choose File',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Constants.primary_color,
                        fontSize: 13,
                        fontWeight: FontWeight.w800))
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconButton(
                    onPressed: null,
                    icon: Icon(null),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                  _attachment!.path.contains('.pdf')
                      ? FutureBuilder<File>(
                          future: PdfUtils().pdfToImage(_attachment!),
                          builder: (context, snapshot) => snapshot.hasData
                              ? Image.file(
                                  snapshot.data!,
                                  width: MediaQuery.of(context).size.width / 2,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                )
                              : SizedBox(width: MediaQuery.of(context).size.width / 2),
                        )
                      : Image.file(
                          _attachment!,
                          width: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _attachment = null;
                      });
                    },
                    icon: const Icon(Icons.close),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    visualDensity: const VisualDensity(vertical: -4),
                  )
                ],
              ),
      ),
    );
  }
}
