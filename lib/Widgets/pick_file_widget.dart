import 'dart:developer';
import '../Utils/enum.dart';
import '../Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Bloc/editProfileBloc/edit_profile_bloc.dart';

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
  late EditProfileBloc editProfileBloc;
  late AnimationController loadingController;

  @override
  void initState() {
    editProfileBloc = EditProfileBloc();
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    editProfileBloc.close();
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
        create: (context) => EditProfileBloc(),
        child: BlocListener<EditProfileBloc, EditProfileStates>(
          listenWhen: (previous, current) =>
              current.postApiStatus != previous.postApiStatus,
          listener: (context, state) {
            if (state.postApiStatus == PostApiStatus.error) {
              Utils.errorMessageFlush(state.message, context);
              log("Pick file:${state.message}");
            }
            if (state.postApiStatus == PostApiStatus.success) {
              log("_file Extenshion in file pick:${state.platformFile!.extension}");
              log("_file in file pick:${state.file}");
              log("_platformFile in file pick:${state.platformFile}");
              loadingController.forward().whenComplete(
                () {
                  Utils.toastMessage("File upload successfully");
                },
              );
            }
          },
          child: BlocBuilder<EditProfileBloc, EditProfileStates>(
            builder: (context, state) {
              return state.platformFile != null
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
                                    child: state.platformFile!.extension ==
                                            'pdf'
                                        ? Container(
                                            width: 80,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            color: const Color.fromARGB(
                                                255, 177, 18, 6),
                                            child: Text(
                                              state.platformFile!.name
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : Image.file(
                                            state.file!,
                                            width: 70,
                                          )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.platformFile!.name,
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${(state.platformFile!.size / 1024).ceil()} KB',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          height: 5,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                            onTap: () {
                              context
                                  .read<EditProfileBloc>()
                                  .add(const FilePickEvent());
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Escoger Archivo",
                                  style: TextStyle(
                                      color: Color(0xFF3E34B5), fontSize: 12),
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
            },
          ),
        ));
  }
}
