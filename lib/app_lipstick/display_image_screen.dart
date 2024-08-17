import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImageScreen extends StatelessWidget {
  final String imagePath;

  const DisplayImageScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.send,
          size: 30,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
            color: Colors.white
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.crop,
                size: 30, color: Colors.white
            ),
            onPressed: () {
              Navigator.pop(context, imagePath);
            },
          ),
          IconButton(
            icon: const Icon(
                Icons.image_search_outlined,
                size: 30,
                color: Colors.white
            ),
            onPressed: () {
              Navigator.pop(context, imagePath);
            },
          ),
        ],
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
