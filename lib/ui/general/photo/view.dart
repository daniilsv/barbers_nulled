import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart' as pw;

class PhotoView extends StatelessWidget {
  const PhotoView({Key key, this.photo}) : super(key: key);
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: pw.PhotoView(
          imageProvider: NetworkImage(photo),
        ),
      ),
    );
  }
}
