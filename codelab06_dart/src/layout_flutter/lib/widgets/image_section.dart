import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://img.inews.co.id/media/600/files/networks/2022/05/07/5eb63_kenjeran.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }
}
