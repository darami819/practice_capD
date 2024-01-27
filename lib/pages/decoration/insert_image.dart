import 'package:flutter/material.dart';

class ImagePlacementPage extends StatefulWidget {
  final String imagePath;

  const ImagePlacementPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _ImagePlacementPageState createState() => _ImagePlacementPageState();
}

class _ImagePlacementPageState extends State<ImagePlacementPage> {
  Offset position = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place your image'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              child: Image.asset(widget.imagePath, width: 100, height: 100),
              feedback: Image.asset(widget.imagePath, width: 100, height: 100),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  position = offset;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
