import 'package:flutter/material.dart';

class FullScreenImageDialog extends StatefulWidget {
  final String? imageUrl;

  FullScreenImageDialog({required this.imageUrl});

  @override
  _FullScreenImageDialogState createState() => _FullScreenImageDialogState();
}

class _FullScreenImageDialogState extends State<FullScreenImageDialog> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black.withOpacity(1),
        body: Stack(
          children: <Widget>[
            GestureDetector(
              onScaleStart: (ScaleStartDetails details) {
                _previousScale = _scale;
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                  _scale = _scale.clamp(0.5, 2.0);
                });
              },
              child: Center(
                child: Hero(
                  tag: 'profileImage', // The same tag used in InkWell
                  child: Transform.scale(
                    scale: _scale,
                    child: Image.network(
                      widget.imageUrl ?? '',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
}
