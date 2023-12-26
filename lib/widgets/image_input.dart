import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageInput extends StatefulWidget {

  final Function onSelectImage;

   const ImageInput(this.onSelectImage,{super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          child: (_storedImage != null)
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'no image uploaded',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: Text("take picture"),
        )),
      ],
    );
  }
}
