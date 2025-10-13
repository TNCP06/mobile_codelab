import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        '🏖️ Pantai Kenjeran – Surabaya\n\n'
        'Pantai Kenjeran terletak di Kecamatan Kenjeran, Surabaya, dan merupakan salah satu destinasi wisata alam yang populer di kota ini. '
        'Pantai ini menawarkan pemandangan laut yang indah, dengan pasir putih yang membentang luas, serta deburan ombak yang menenangkan. '
        'Pengunjung dapat menikmati suasana pantai yang tenang sambil berjalan-jalan di sepanjang bibir pantai atau duduk santai menikmati angin laut.\n\n'
        'Selain keindahan alamnya, Pantai Kenjeran juga memiliki berbagai fasilitas wisata, seperti area bermain anak, tempat makan, dan spot foto yang Instagramable. '
        'Salah satu daya tarik utama di Pantai Kenjeran adalah Jembatan Suramadu yang terlihat jelas dari pantai ini, memberikan latar belakang yang menakjubkan untuk berfoto. '
        'Pantai ini juga sering menjadi lokasi untuk berbagai acara dan festival, menjadikannya tempat yang cocok untuk dikunjungi bersama keluarga atau teman.\n\n'
        'Nama: Tionusa Catur Pamungkas \nNIM: 2341720093',
        softWrap: true,
      ),
    );
  }
}
