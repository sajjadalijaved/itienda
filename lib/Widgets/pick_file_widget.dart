import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget>
    with SingleTickerProviderStateMixin {
  File? _file;
  PlatformFile? _platformFile;
  late AnimationController loadingController;
  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;

        log("_file:${_platformFile!.extension}");
        log("_file:$_file");
        log("_platformFile:$_platformFile");
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return _platformFile != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: _platformFile!.extension == 'pdf'
                              ? Container(
                                  width: 80,
                                  height: 50,
                                  color: const Color.fromARGB(255, 177, 18, 6),
                                  child: Center(
                                    child: Text(
                                      _platformFile!.name.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Image.file(
                                  _file!,
                                  width: 70,
                                )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _platformFile!.name,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${(_platformFile!.size / 1024).ceil()} KB',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                height: 5,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue.shade50,
                                ),
                                child: LinearProgressIndicator(
                                  value: loadingController.value,
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          )
        : Padding(
            padding: EdgeInsets.only(left: width * 0.020),
            child: SizedBox(
                height: height * 0.03,
                child: GestureDetector(
                  onTap: selectFile,
                  child: Row(
                    children: [
                      const Text(
                        "Escoger Archivo",
                        style:
                            TextStyle(color: Color(0xFF3E34B5), fontSize: 12),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      const Icon(
                        Icons.upload_outlined,
                        color: Color(0xFF3E34B5),
                        size: 20,
                      )
                    ],
                  ),
                )),
          );
  }
}
