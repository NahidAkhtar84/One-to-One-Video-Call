import 'package:flutter/material.dart';

class MedimateLogo extends StatelessWidget {
  final double width;
  final String assetFilePath;
  const MedimateLogo(
      {Key key,
      this.width = 200,
      this.assetFilePath = "assets/images/mediMate.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Image(
        image: AssetImage(assetFilePath),
        fit: BoxFit.contain,
      ),
    );
  }
}
