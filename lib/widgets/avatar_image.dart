import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    this.onChange,
    this.url,
    this.file,
    this.isEditable = false,
    this.size = 48,
  });

  final String url;
  final File file;
  final bool isEditable;
  final Function(File) onChange;
  final double size;

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      padding:const  EdgeInsets.all(8),
      decoration:const  BoxDecoration(
        color: Color(0xFFECECEC),
      ),
      child: Image.asset(
        "assets/images/camera.png",
        width: 2,
        height: 2,
      ),
    );
    if (file != null)
      body = Image.file(
        file,
        fit: BoxFit.cover,
      );
    else if (url != null && url.isNotEmpty)
      body = Image.network(
        url,
        fit: BoxFit.cover,
      );
    body = AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: body,
      ),
    );
    body = Container(
      constraints: BoxConstraints(
        maxWidth: size,
        maxHeight: size,
      ),
      child: body,
    );
    if (isEditable)
      body = GestureDetector(
        onTap: _showImagePicker,
        child: body,
      );
    return body;
  }

  Future<void> _showImagePicker() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    if (file == null) return;
    onChange(File(file.path));
  }
}
