import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;

  const ImageButton({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() { _scale = 0.95; });
      },
      onTapUp: (_) {
        setState(() { _scale = 1.0; });
      },
      onTapCancel: () {
        setState(() { _scale = 1.0; });
      },
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(seconds: 0),
        child: ClipOval(
          child: Image.asset(
            widget.imagePath,
            width: widget.size,
            height: widget.size,
          ),
        ),
      ),
    );
  }
}
