import 'package:flutter/material.dart';
import 'package:layout_flutter/widgets/button_section.dart';
import 'package:layout_flutter/widgets/image_section.dart';
import 'package:layout_flutter/widgets/text_section.dart';
import 'package:layout_flutter/widgets/title_row.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Tionusa Catur Pamungkas dan 2341720093',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter layout: Tionusa Catur Pamungkas dan 2341720093',
          ),
        ),
        body: ListView(
          children: [
            ImageSection(),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),
      ),
    );
  }
}
