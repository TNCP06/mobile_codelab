<p align="center">
  <img src="https://dianisa.com/wp-content/uploads/2024/05/Logo-Politeknik-Negeri-Malang-Dianisa.com_.png" alt="Logo Polinema" width="150">
</p>

<h1 align="center">LAPORAN PRAKTIKUM</h1>
<h2 align="center">JOBSHEET 06</h2>
<h3 align="center">Konsep Layout Flutter</h3>

---

<div align="center">

### **Dosen Pembimbing**

**Habibie Ed Dien, S.Kom., M.T.**

---

### **Disusun oleh**

**Nama** : Tionusa Catur Pamungkas

**NIM** : 2341720093

**Kelas** : TI-3G

**Program Studi** : D-4 Teknik Informatika

---

### **Alamat Kampus**

Politeknik Negeri Malang
Jl. Soekarno Hatta No.9, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141
**Phone** : (0341) 404424, 404425
**Email** : [Polinema.ac.id](https://www.polinema.ac.id)

</div>

---

# Praktikum 1: Membangun Layout di Flutter

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama layout_flutter. Atau sesuaikan style laporan praktikum yang Anda buat.

## Langkah 2: Buka file lib/main.dart

Buka file main.dart lalu ganti dengan kode berikut. Isi nama dan NIM Anda di text title.

![nama dan nim](img/praktikum1_langkah2_week06mobile.jpg.png)

# Langkah 3: Identifikasi Layout Diagram

## Elemen besar (top-down)

- Root: `ListView` (bertindak sebagai kolom vertikal)
  1. `Image` (header, `height: 240`, `fit: BoxFit.cover`)
  2. **Title section** → `Padding(16)` → `Row(...)`
  3. **Button section** → `Padding(h:24, v:8)` → `Row(...)`
  4. **Text section** → `Padding(24)` → `Text(_desc)`

---

### 1. Identifikasi baris & kolom

**Title section** = `Row` (3 anak):

- `Expanded(Column)` menghasilkan 2 teks:
- Judul: `Text('Oeschinen Lake Campground', bold)`
- Subjudul: `Text('Kandersteg, Switzerland', color: black54)`
- `Icon(Icons.star, color: red)`
- `Text('41')`
- disini `Expanded` membuat kolom teks dengan mengambil sisa ruang sehingga ikon bintang dan angka terdorong ke kanan.

**Button section** = `Row` (3 anak):

- Masing-masing row (anak) adalah `Column(mainAxisSize: min)` yang berisi:
- `Icon(...)` (berwarna **primary/blue**)
- `SizedBox(height: 8)`
- `Text(label, color: primary, fontWeight: w600)`
- menggunakan `mainAxisAlignment: spaceEvenly` agar ketiganya dapat tersebar rata.

---

### 2. Apakah menyertakan grid?

**Tidak.** Karena Tidak ada `GridView`; dan hanya kombinasi `Row` + `Column`.

---

### 3. Apakah ada elemen tumpang tindih?

**Tidak.** Tidak ada `Stack/Positioned`, jadi tidak ada tumpah tindih pada elemen.

---

### 4. Apakah UI memerlukan tab?

**Tidak.** karena tidak menggunakan `TabBar/TabBarView`.

---

### 5. Alignment, padding, borders

**Alignment**

- Title: `crossAxisAlignment: CrossAxisAlignment.start` pada kolom teks; `Expanded` menekan ikon bintang dan angka ke sisi kanan baris.
- Buttons: `mainAxisAlignment: MainAxisAlignment.spaceEvenly` pada `Row`.

**Padding**

- Title: `EdgeInsets.all(16)`
- Buttons: `EdgeInsets.symmetric(horizontal: 24, vertical: 8)`
- Text: `EdgeInsets.all(24)`

**Borders**

- **Tidak ada** border/kartu. (Jika diperlukan styling, bisa bungkus dengan `Card` atau `Container(decoration: BoxDecoration(...))`.)

---

![Membuat Widget](img/praktikum1_langkah3_week06mobile.jpg.png)

## Langkah 4: Implementasi title row

Pertama, Anda akan membuat kolom bagian kiri pada judul. Tambahkan kode berikut di bagian atas metode build() di dalam kelas MyApp:

1. Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.

   ```dart
   Expanded(
   // soal 1: Column di dalam Expanded + crossAxisAlignment.start
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
   ```

2. Letakkan baris pertama teks di dalam Container sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘Batu, Malang, Indonesia' di dalam Column, set warna menjadi abu-abu.

   ```dart
   // soal 2: baris pertama di dalam Container dengan bottom padding 8
   Container(
   padding: const EdgeInsets.only(bottom: 8),
   child: const Text(
     'Jawa Timur Park 1',
       style: TextStyle(
       fontWeight: FontWeight.bold,
             ),
           ),
       ),
   // soal 2: baris kedua warna abu-abu
   const Text(
   'Batu, Malang, Indonesia',
   style: TextStyle(color: Colors.grey),
           ),
         ],
       ),
     ),
   ```

3. Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam Container dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi body text ‘Hello World' dengan variabel titleSection seperti berikut:

   ```dart
   // soal 3: ikon bintang merah + teks "41"
             const Icon(Icons.star, color: Colors.red),
             const SizedBox(width: 8),
             const Text('4.1'),
           ],
         ),
       );

       return MaterialApp(
         title: 'Flutter layout: Cakra Wangsa M.A.W - 2341720032',
         home: Scaffold(
           appBar: AppBar(
             title: const Text('Cakra Wangsa M.A.W - 2341720032'),
           ),
           // Ganti 'Hello World' dengan titleSection
           body: titleSection,
         ),
       );
     }
   }
   ```

![langkah 4 default](img/praktikum1_langkah4_week06mobile.jpg.png)

# Praktikum 2: Implementasi button row

## Langkah 1: Buat method Column \_buildButtonColumn

Bagian tombol berisi 3 kolom yang menggunakan tata letak yang sama—sebuah ikon di atas baris teks. Kolom pada baris ini diberi jarak yang sama, dan teks serta ikon diberi warna primer.

Karena kode untuk membangun setiap kolom hampir sama, buatlah metode pembantu pribadi bernama buildButtonColumn(), yang mempunyai parameter warna, Icon dan Text, sehingga dapat mengembalikan kolom dengan widgetnya sesuai dengan warna tertentu.

lib/main.dart (\_buildButtonColumn)

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ···
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
```

![method column](img/praktikum2_langkah1_week06mobile.jpg.png)

## Langkah 2: Buat widget buttonSection

Buat Fungsi untuk menambahkan ikon langsung ke kolom. Teks berada di dalam Container dengan margin hanya di bagian atas, yang memisahkan teks dari ikon.

Bangun baris yang berisi kolom-kolom ini dengan memanggil fungsi dan set warna, Icon, dan teks khusus melalui parameter ke kolom tersebut. Sejajarkan kolom di sepanjang sumbu utama menggunakan MainAxisAlignment.spaceEvenly untuk mengatur ruang kosong secara merata sebelum, di antara, dan setelah setiap kolom. Tambahkan kode berikut tepat di bawah deklarasi titleSection di dalam metode build():

lib/main.dart (buttonSection)

```dart
Color color = Theme.of(context).primaryColor;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
```

![widget buttonsection](img/praktikum2_langkah2_week06mobile.jpg.png)

## Langkah 3: Tambah button section ke body

Tambahkan variabel buttonSection ke dalam body seperti berikut:

![button section](img/praktikum2_langkah3_week06mobile.jpg.png)

# Praktikum 3: Implementasi text section

## Langkah 1: Buat widget textSection

Tentukan bagian teks sebagai variabel. Masukkan teks ke dalam Container dan tambahkan padding di sepanjang setiap tepinya. Tambahkan kode berikut tepat di bawah deklarasi buttonSection:

![widgettextSection](img/praktikum3_langkah1_week06mobile.jpg.png)

## Langkah 2: Tambahkan variabel text section ke body

Tambahkan widget variabel textSection ke dalam body seperti berikut:

![text section](img/praktikum3_langkah2_week06mobile.jpg.png)

# Praktikum 4: Implementasi image section

Selesaikan langkah-langkah praktikum berikut ini dengan melanjutkan dari praktikum sebelumnya.

## Langkah 1: Siapkan aset gambar

Anda dapat mencari gambar di internet yang ingin ditampilkan. Buatlah folder images di root project layout_flutter. Masukkan file gambar tersebut ke folder images, lalu set nama file tersebut ke file pubspec.yaml seperti berikut:

![pubspec.yaml](img/praktikum4_langkah1_week06mobile.jpg.png)

## Langkah 2: Tambahkan gambar ke body

Tambahkan aset gambar ke dalam body seperti berikut:

![gambar ke body](img/praktikum4_langkah2_week06mobile.jpg.png)

BoxFit.cover memberi tahu kerangka kerja bahwa gambar harus sekecil mungkin tetapi menutupi seluruh kotak rendernya.

## Langkah 3: Terakhir, ubah menjadi ListView

Pada langkah terakhir ini, atur semua elemen dalam ListView, bukan Column, karena ListView mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.

![ListView](img/praktikum4_langkah3_week06mobile.jpg.png)

# Tugas Praktikum 1

1. Selesaikan Praktikum 1 sampai 4, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file README.md! (DONE)

2. Silakan implementasikan di project baru "basic_layout_flutter" dengan mengakses sumber ini: https://docs.flutter.dev/codelabs/layout-basics

### Penggunaan Widget
Flutter bekerja dengan prinsip dasar menyusun antarmuka (UI) dari potongan-potongan kecil yang disebut widget. Widget ini bisa digabungkan seperti balok balok hingga membentuk tampilan aplikasi yang utuh.

pada kode dibawah menunjukkan mengenai struktur tingkat atas dari aplikasi, dimana ListView sebagai widget utama yang dibangun dari kombinasi Image, ListTile, dan Card.

```dart
body: ListView(
 children: [
   Image.asset(
     'images/gunungkelud.jpg',
     width: 600,
     height: 240,
     fit: BoxFit.cover,
   ),
   titleSection,
   Card(
   ),
 ],
),
```

### Penggunaan Row dan Column

Row dan Column merupakan dua widget dasar dalam Flutter yang berfungsi untuk mengatur tata letak. Row digunakan untuk menyusun widget secara horizontal (mendatar), sedangkan Column digunakan untuk menyusun widget secara vertikal (menurun).
Berikut contoh kode penggunaan Row untuk menyejajarkan beberapa tombol:

```dart
Widget buttonSection = Row(
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: [
   _buildButtonColumn(color, Icons.call, 'REVIEW'),
   _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
   _buildButtonColumn(color, Icons.share, 'SHARE'),
 ],
);
```

Berikut adalah contoh penggunaan Column untuk menyusun ikon dan teks pada sebuah tombol secara vertikal. Dengan Column, elemen-elemen dapat ditumpuk dari atas ke bawah sehingga membentuk tata letak yang rapi.

```dart
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        // ...
      ),
    ],
  );
}
```

### Penggunaan ListView

ListView merupakan widget yang serupa dengan Column, namun memiliki keunggulan tambahan berupa kemampuan untuk digulir (scroll) secara otomatis ketika konten melebihi ukuran layar. Fitur ini sangat penting untuk mencegah terjadinya error overflow serta memastikan aplikasi tetap berjalan optimal pada berbagai ukuran layar.

Pada kode ini, seluruh komponen utama antarmuka pengguna—seperti Image, titleSection, dan Card—ditempatkan di dalam sebuah ListView yang berfungsi sebagai body dari Scaffold.

```dart
body: ListView(
 children: [
   Image.asset(
     // ...
   ),
   titleSection,
   Card(
     // ...
   ),
 ],
),
```

### Penggunaan Container

Container merupakan widget serbaguna yang berfungsi sebagai wadah untuk membungkus widget lain. Melalui Container, kita dapat menambahkan margin atau padding, memberikan warna latar belakang, maupun menambahkan dekorasi seperti bingkai (border).

Pada kode ini, Container digunakan secara khusus untuk memberikan margin (jarak atas dan bawah) pada teks di dalam setiap tombol.

```dart
Container(
 margin: const EdgeInsets.only(top: 8, bottom: 8),
 child: Text(
   label,
   // ...
 ),
),
// ...
```

### Penggunaan Card

Card merupakan widget bawaan Material Design yang berfungsi sebagai panel dengan sudut membulat serta efek bayangan (elevation). Widget ini digunakan untuk mengelompokkan informasi yang saling berkaitan sekaligus memberikan penekanan visual.

Pada kode ini, Card dimanfaatkan untuk membungkus buttonSection dan textSection, sehingga keduanya tampil dalam satu panel yang terangkat secara visual.

```dart
Card(
 margin: const EdgeInsets.all(16.0),
 elevation: 4.0,
 child: Column(
   children: [
     buttonSection,
     textSection,
   ],
 ),
),
```

### Penggunaan ListTile

ListTile merupakan widget berbentuk baris yang telah distilisasi dan dioptimalkan untuk menampilkan item dalam sebuah daftar. Widget ini menyediakan slot khusus seperti title (judul), subtitle (subjudul), dan trailing (widget di sisi kanan), sehingga memudahkan pembuatan baris yang kompleks.

Pada kode ini, ListTile digunakan untuk menggantikan struktur Row dan Column yang rumit pada bagian judul, sehingga tampil lebih ringkas dan mudah dipahami.

```dart
Widget titleSection = ListTile(
 title: const Text(
   'Oeschinen Lake Campground',
   style: TextStyle(fontWeight: FontWeight.bold),
 ),
 subtitle: Text(
   'Kandersteg, Switzerland',
   style: TextStyle(color: Colors.grey[500]),
 ),
 trailing: Row(
   mainAxisSize: MainAxisSize.min,
   children: [
     Icon(Icons.star, color: Colors.red[500]),
     const Text('41'),
   ],
 ),
 contentPadding: const EdgeInsets.all(32),
);
```

### Penggunaan Stack

Stack adalah widget yang berfungsi untuk menumpuk beberapa widget secara berlapis, mirip dengan menumpuk kartu atau foto. Widget pertama dalam daftar children akan menjadi lapisan dasar, sedangkan widget berikutnya akan ditampilkan di atasnya. Untuk mengatur posisi setiap lapisan secara presisi, biasanya digunakan widget Positioned.

Pada kode ini, Stack digunakan untuk menempatkan sebuah Container berisi teks (dengan Positioned) di atas Image.asset.

```dart
Stack(
  alignment: Alignment.bottomLeft,
  children: [
    Image.asset(
      'images/gunungkelud.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    ),
    Positioned(
      bottom: 16,
      left: 16,
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        color: Colors.black54,
        child: const Text(
          'Gunung Kelud',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ],
)
```

### Struktur Kode Lengkap

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = ListTile(
      title: const Text(
        'Wisata Gunung Kelud',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Kabupaten Kediri, Jawa Timur',
        style: TextStyle(color: Colors.grey[500]),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.red[500]),
          const Text('5.0'),
        ],
      ),
      contentPadding: const EdgeInsets.all(32),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'REVIEW'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
          'Gunung Kelud berada di Jawa Timur dengan ketinggian sekitar 1.731 mdpl. '
          'Dikenal sebagai gunung berapi aktif, Kelud menawarkan pemandangan kawah '
          'menawan dan udara sejuk, menjadikannya tujuan populer untuk wisata alam.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Destinasi Wisata Jawa Timur')),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  'images/gunungkelud.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Gunung Kelud',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            titleSection,
            Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 4.0,
              child: Column(children: [buttonSection, textSection]),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
```

### OUTPUT AKHIR UJI COBA

![TUGAS PRAK 1](img/TugasPraktikum1.png)



3. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!



# Praktikum 5: Membangun Navigasi di Flutter

Pada praktikum 5 ini anda akan belajar mengenai pembangunan aplikasi bergerak multi halaman. Aplikasi yang dikembangkan berupa kasus daftar barang belanja. Pada aplikasi ini anda akan belajar untuk berpindah halaman dan mengirimkan data ke halaman lainnya. Gambaran mockup hasil akhir aplikasi dapat anda lihat pada gambar di atas (mockup dibuat sederhana, sehingga Anda mempunyai banyak ruang untuk berkreasi). Desain aplikasi menampilkan sebuah ListView widget yang datanya bersumber dari List. Ketika item ditekan, data akan dikirimkan ke halaman berikutnya.

## Langkah 1: Siapkan project baru

Sebelum melanjutkan praktikum, buatlah sebuah project baru Flutter dengan nama belanja dan susunan folder seperti pada gambar berikut. Penyusunan ini dimaksudkan untuk mengorganisasi kode dan widget yang lebih mudah.

![project baru](img/praktikum5_langkah1_week06mobile.jpg.png)

## Langkah 2: Mendefinisikan Route

Buatlah dua buah file dart dengan nama home_page.dart dan item_page.dart pada folder pages. Untuk masing-masing file, deklarasikan class HomePage pada file home_page.dart dan ItemPage pada item_page.dart. Turunkan class dari StatelessWidget. Gambaran potongan kode dapat anda lihat sebagai berikut.

### File home_page.dart

```dart
import 'package:flutter/material.dart';
import 'item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ItemPage()),
            );
          },
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Go to Item Page'),
        ),
      ),
    );
  }
}
```

### File item_page.dart

```dart
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Page')),
      body: const Center(
        child: Text('This is the Item Page'),
      ),
    );
  }
}
```

## Langkah 3: Lengkapi Kode di main.dart

Setelah kedua halaman telah dibuat dan didefinisikan, bukalah file main.dart. Pada langkah ini anda akan mendefinisikan Route untuk kedua halaman tersebut. Definisi penamaan route harus bersifat unique. Halaman HomePage didefinisikan sebagai /. Dan halaman ItemPage didefinisikan sebagai /item. Untuk mendefinisikan halaman awal, anda dapat menggunakan named argument initialRoute. Gambaran tahapan ini, dapat anda lihat pada potongan kode berikut.

```dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/item': (context) => const ItemPage(),
      },
    );
  }
}
```

## Langkah 4: Membuat data model

Sebelum melakukan perpindahan halaman dari HomePage ke ItemPage, dibutuhkan proses pemodelan data. Pada desain mockup, dibutuhkan dua informasi yaitu nama dan harga. Untuk menangani hal ini, buatlah sebuah file dengan nama item.dart dan letakkan pada folder models. Pada file ini didefinisikan pemodelan data yang dibutuhkan. Ilustrasi kode yang dibutuhkan, dapat anda lihat pada potongan kode berikut.

```dart
class Item {
  String name;
  int price;

  Item({this.name, this.price});
}
```

## Langkah 5: Lengkapi kode di class HomePage

Pada halaman HomePage terdapat ListView widget. Sumber data ListView diambil dari model List dari object Item. Gambaran kode yang dibutuhkan untuk melakukan definisi model dapat anda lihat sebagai berikut.

```dart
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Sumber data ListView dari model Item
  final List<Item> items = const [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt',  price: 2000),
    Item(name: 'Coffee', price: 15000),
    Item(name: 'Tea',    price: 8000),
  ];
```

## Langkah 6: Membuat ListView dan itemBuilder

Untuk menampilkan ListView pada praktikum ini digunakan itemBuilder. Data diambil dari definisi model yang telah dibuat sebelumnya. Untuk menunjukkan batas data satu dan berikutnya digunakan widget Card. Kode yang telah umum pada bagian ini tidak ditampilkan. Gambaran kode yang dibutuhkan dapat anda lihat sebagai berikut.

### Jalankan aplikasi pada emulator atau pada device anda.

![run aplikasi](img/praktikum5_langkah6_week06mobile.jpg.png)

## Langkah 7: Menambahkan aksi pada ListView

Item pada ListView saat ini ketika ditekan masih belum memberikan aksi tertentu. Untuk menambahkan aksi pada ListView dapat digunakan widget InkWell atau GestureDetector. Perbedaan utamanya InkWell merupakan material widget yang memberikan efek ketika ditekan. Sedangkan GestureDetector bersifat umum dan bisa juga digunakan untuk gesture lain selain sentuhan. Pada praktikum ini akan digunakan widget InkWell.

Untuk menambahkan sentuhan, letakkan cursor pada widget pembuka Card. Kemudian gunakan shortcut quick fix dari VSCode (Ctrl + . pada Windows atau Cmd + . pada MacOS). Sorot menu wrap with widget... Ubah nilai widget menjadi InkWell serta tambahkan named argument onTap yang berisi fungsi untuk berpindah ke halaman ItemPage. Ilustrasi potongan kode dapat anda lihat pada potongan berikut.

```dart
return Card(
  child: InkWell(
    onTap: () {
  // ke ItemPage via named route + kirim data
  Navigator.pushNamed(context, '/item', arguments: item);
  },
```

### Output Akhir

#### Tampilan HomePage

![tampilan final](img/praktikum5_langkah7_week06mobile.jpg.png)

#### Tampilan ItemPage

![tampilan final](img/praktikum5_langkah7.2_week06mobile.jpg.png)

# Tugas Praktikum 2

## 1. Untuk melakukan pengiriman data ke halaman berikutnya, cukup menambahkan informasi arguments pada penggunaan Navigator. Perbarui kode pada bagian Navigator menjadi seperti berikut.

    ```dart
      itemBuilder: (context, index) {
        onTap: () {
        Navigator.pushNamed(context, '/item', arguments: items[index]);
      };
    ```

## 2. Pembacaan nilai yang dikirimkan pada halaman sebelumnya dapat dilakukan menggunakan ModalRoute. Tambahkan kode berikut pada blok fungsi build dalam halaman ItemPage. Setelah nilai didapatkan, anda dapat menggunakannya seperti penggunaan variabel pada umumnya. (https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments)

    ```dart
      Widget build(BuildContext context) {
        final item = ModalRoute.of(context)!.settings.arguments as Item?;
    ```

## 3. Pada hasil akhir dari aplikasi belanja yang telah anda selesaikan, tambahkan atribut foto produk, stok, dan rating. Ubahlah tampilan menjadi GridView seperti di aplikasi marketplace pada umumnya.

### pubspec.yaml

```dart
  uses-material-design: true
  assets:
    - assets/images/
```

### item.dart

```dart
class Item {
  final String name;
  final int price;
  final String imageUrl;
  final int stock;
  final double rating;

  const Item({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.rating,
  });
}
```

### HomePage GridView

```dart
import 'package:flutter/material.dart';

import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Gula',
      price: 5000,
      imageUrl: 'assets/images/gula.jpg',
      stock: 25,
      rating: 4.5,
    ),
    Item(
      name: 'Garam',
      price: 2000,
      imageUrl: 'assets/images/garam.jpg',
      stock: 15,
      rating: 4.2,
    ),
    Item(
      name: 'Teh',
      price: 12000,
      imageUrl: 'assets/images/teh.jpeg',
      stock: 30,
      rating: 4.8,
    ),
    Item(
      name: 'Minyak Goreng',
      price: 15000,
      imageUrl: 'assets/images/minyak goreng.jpeg',
      stock: 20,
      rating: 4.3,
    ),
    Item(
      name: 'Kopi',
      price: 8000,
      imageUrl: 'assets/images/kopi.jpg',
      stock: 18,
      rating: 4.6,
    ),
  ];

  Widget _getProductIcon(String productName) {
    IconData iconData;
    Color iconColor;

    switch (productName.toLowerCase()) {
      case 'gula':
        iconData = Icons.grain;
        iconColor = Colors.white;
        break;
      case 'garam':
        iconData = Icons.scatter_plot;
        iconColor = Colors.grey[300]!;
        break;
      case 'teh':
        iconData = Icons.rice_bowl;
        iconColor = Colors.brown[200]!;
        break;
      case 'minyak goreng':
        iconData = Icons.water_drop;
        iconColor = Colors.yellow[600]!;
        break;
      case 'kopi':
        iconData = Icons.bakery_dining;
        iconColor = Colors.brown[100]!;
        break;
      default:
        iconData = Icons.shopping_basket;
        iconColor = Colors.grey;
        break;
    }

    return Center(child: Icon(iconData, size: 48, color: iconColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CakraMarketplace',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            // Header section with greeting
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang di CakraMarketplace!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Temukan produk terbaik dengan harga terjangkau',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Products grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final heroTag = 'item-hero-${item.name}';

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/item', arguments: item);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Card(
                          elevation: 6,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  child: Hero(
                                    tag: heroTag,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        item.imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[200],
                                                child: _getProductIcon(
                                                  item.name,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Product Details
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Product Name
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      // Price
                                      Text(
                                        'Rp ${item.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // Rating and Stock
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            item.rating.toString(),
                                            style: const TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Stok: ${item.stock}',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: item.stock > 10
                                                  ? Colors.green
                                                  : Colors.orange,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Output

![final](img/tugaspraktikum2_langkah3_week06mobile.jpg.png)

![final.2](img/tugaspraktikum2_langkah3.2_week06mobile.jpg.png)

## 4. Silakan implementasikan Hero widget pada aplikasi belanja Anda dengan mempelajari dari sumber ini: https://docs.flutter.dev/cookbook/navigation/hero-animations

```dart
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final heroTag = 'item-hero-${item.name}';

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/item', arguments: item);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Card(
                          elevation: 6,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  child: Hero(
                                    tag: heroTag,
```

```dart
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    final heroTag = 'item-hero-${item.name}';

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Hero(
                tag: heroTag,
```

![widget hero](img/testingwidgethero.gif)

## 5. Sesuaikan dan modifikasi tampilan sehingga menjadi aplikasi yang menarik. Selain itu, pecah widget menjadi kode yang lebih kecil. Tambahkan Nama dan NIM di footer aplikasi belanja Anda.

## menambahkan dan melakukan modifikasi pada tampilan flutter

### Product_card.dart

```dart
import 'package:flutter/material.dart';

import '../models/item.dart';

class ProductCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.item, required this.onTap});

  Widget _getProductIcon(String productName) {
    String imageUrl;

    switch (productName.toLowerCase()) {
      case 'gula':
        imageUrl = 'assets/images/gula.jpg';
        break;
      case 'garam':
        imageUrl = 'assets/images/garam.jpg';
        break;
      case 'teh':
        imageUrl = 'assets/images/teh.jpeg';
        break;
      case 'minyak goreng':
        imageUrl = 'assets/images/minyak goreng.jpeg';
        break;
      case 'kopi':
        imageUrl = 'assets/images/kopi.jpg';
        break;
      default:
        return Center(
          child: Icon(Icons.shopping_basket, size: 48, color: Colors.grey),
        );
    }

    return Center(
      child: Image.asset(
        imageUrl,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.shopping_basket, size: 48, color: Colors.grey);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heroTag = 'item-hero-${item.name}';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.grey.shade50],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with gradient overlay
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Hero(
                        tag: heroTag,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            item.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: _getProductIcon(item.name),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // Gradient overlay for better text readability
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Product Details
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Name
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Price with better styling
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Rp ${item.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Rating and Stock
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: item.stock > 10
                                  ? Colors.green.shade50
                                  : Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Stok: ${item.stock}',
                              style: TextStyle(
                                fontSize: 10,
                                color: item.stock > 10
                                    ? Colors.green.shade700
                                    : Colors.orange.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Welcome Header

```dart
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.deepPurple.shade50],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.waving_hand,
                    color: Colors.deepPurple.shade600,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang di CakraMarketplace!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Temukan produk terbaik dengan harga terjangkau',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Stats Row
            Row(
              children: [
                _buildStatItem(Icons.inventory, '500+', 'Produk'),
                const SizedBox(width: 16),
                _buildStatItem(Icons.people, '10K+', 'Pelanggan'),
                const SizedBox(width: 16),
                _buildStatItem(Icons.star, '4.8', 'Rating'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.deepPurple.shade600, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Custom APP Bar

```dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple.shade600, Colors.deepPurple.shade800],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_bag, color: Colors.white, size: 24),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur pencarian belum tersedia')),
              );
            },
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart, color: Colors.white),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Keranjang belanja belum tersedia'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

### APP Footer

```dart
import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple.shade600, Colors.deepPurple.shade800],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo or App Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                'CakraMarketplace',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Divider
          Container(
            height: 1,
            width: 100,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 12),
          // Student Info
          Column(
            children: [
              Text(
                'Cakra Wangsa May Ahmad Widodo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoChip('NIM: 2341720032'),
                  const SizedBox(width: 8),
                  _buildInfoChip('TI3G'),
                  const SizedBox(width: 8),
                  _buildInfoChip('08'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Copyright
          Text(
            '© 2025 CakraMarketplace - Mobile Programming',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
```

### HASIL TESTING MODIFIKASI

![final](img/testingfinalbos.gif)

## 6. Selesaikan Praktikum 5: Navigasi dan Rute tersebut. Cobalah modifikasi menggunakan plugin go_router, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file README.md. Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!

# Implementasi Go Router

Pada bagian ini, saya akan mengimplementasikan `go_router` sebagai pengganti navigasi tradisional Flutter untuk aplikasi belanja yang telah dibuat sebelumnya.

## Langkah 1: Menambahkan Dependency Go Router

Pertama, tambahkan dependency `go_router` ke dalam file `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  go_router: ^14.2.7 # Tambahkan dependency go_router
```

## Langkah 2: Konfigurasi Go Router di main.dart

Berikut adalah implementasi go_router dalam `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/item.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        final item = state.extra as Item;
        return ItemPage(item: item);
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CakraMarketplace - Go Router',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router, // Using go_router instead of traditional routes
    );
  }
}
```

**Perbedaan utama dengan implementasi sebelumnya:**

- Menggunakan `MaterialApp.router` instead of `MaterialApp`
- Konfigurasi route menggunakan `GoRouter` dan `GoRoute`
- Parameter routing menggunakan `routerConfig` instead of `routes`

## Langkah 3: Modifikasi HomePage untuk Go Router

Pada `HomePage`, navigasi ke `ItemPage` menggunakan `context.go()`:

```dart
return ProductCard(
  item: item,
  onTap: () {
    context.go('/item', extra: item);
  },
);
```

**Perbedaan dengan navigasi sebelumnya:**

- Sebelumnya: `Navigator.pushNamed(context, '/item', arguments: item)`
- Sekarang: `context.go('/item', extra: item)`

## Langkah 4: Modifikasi ItemPage untuk Go Router

Pada `ItemPage`, data item diterima langsung sebagai parameter constructor:

```dart
class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // No need for ModalRoute.of(context)!.settings.arguments
    // Item is directly available as this.item
    ...
  }
}
```

**Perbedaan dengan implementasi sebelumnya:**

- Sebelumnya: `final item = ModalRoute.of(context)!.settings.arguments as Item;`
- Sekarang: Data item langsung tersedia sebagai parameter constructor

## Langkah 5: Modifikasi Custom App Bar

Untuk tombol back, menggunakan `context.pop()` dari go_router:

```dart
leading: showBackButton
    ? IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => context.pop(), // Using go_router's context.pop()
      )
    : null,
```

## Keuntungan Menggunakan Go Router

1. **Type Safety**: Go router menyediakan type safety yang lebih baik
2. **Declarative Routing**: Routing configuration lebih deklaratif dan mudah dibaca
3. **Deep Linking**: Mendukung deep linking dengan lebih baik
4. **Browser Support**: Mendukung navigasi browser pada Flutter Web
5. **URL Management**: Manajemen URL yang lebih baik untuk web applications
6. **Nested Routing**: Mendukung nested routing yang kompleks

## Perbedaan Implementasi

# Navigator Tradisional dengan Go Router

**Setup**
Navigator tradisional memakai `MaterialApp` dengan properti `routes` (peta nama-rute → widget). Go Router memakai `MaterialApp.router` dan menghubungkan konfigurasi melalui `routerConfig` untuk mengontrol seluruh navigasi berbasis deklaratif.

**Navigasi Maju**
Pada Navigator, kita memanggil `Navigator.pushNamed()` untuk mendorong halaman baru ke stack. Di Go Router, navigasi dilakukan dengan `context.go()` (mengganti rute aktif, cocok untuk “hard navigate”) atau `context.push()` (menambahkan ke stack, mirip `pushNamed`).

**Navigasi Mundur (Back)**
Navigator mundur dengan `Navigator.pop()`. Pada Go Router, perilaku sama dicapai lewat `context.pop()`.

**Mengirim Data (Data Passing)**
Navigator mengirim data dengan parameter `arguments` saat `pushNamed`, lalu dibaca di halaman tujuan. Go Router menyediakan `extra` untuk payload bebas, serta **path parameters** (mis. `/detail/:id`) yang diambil dari segmen URL—memudahkan rute yang bersifat dinamis.

**Definisi Rute**
Navigator mendefinisikan rute sebagai `Map<String, WidgetBuilder>` di `MaterialApp`. Go Router mendeklarasikan daftar `GoRoute` (objek) di dalam `GoRouter`, mendukung pola URL, nested routes, dan kontrol yang lebih kaya atas redirect/guard secara terstruktur.


# Deskripsi perbandinga mengenai Navigator Tradisional dengan Go Router

**Setup.** Navigator tradisional menggunakan `MaterialApp` dengan properti `routes` (peta nama rute menuju builder). Go Router memakai `MaterialApp.router` dan memasok konfigurasi lewat `routerConfig`, sehingga alur navigasi lebih deklaratif dan mudah dikontrol.

**Navigasi.** Pada Navigator, halaman didorong ke stack dengan `Navigator.pushNamed()`. Di Go Router, navigasi dilakukan dengan `context.go()` (mengganti rute aktif, cocok untuk perpindahan “keras”) atau `context.push()` (menambah ke stack seperti `pushNamed`).

**Back Navigation.** Kembali halaman menggunakan `Navigator.pop()` pada Navigator. Di Go Router, perilaku serupa tersedia melalui `context.pop()`.

**Pengiriman Data.** Navigator mengirim data melalui parameter `arguments` saat `pushNamed()`, kemudian diambil di halaman tujuan. Go Router menyediakan `extra` untuk payload bebas dan **path parameters** (mis. `/product/:id`) yang dapat diekstrak langsung dari URL untuk rute dinamis.

**Definisi Rute.** Navigator mendefinisikan rute sebagai `Map<String, WidgetBuilder>` di `MaterialApp`. Go Router mendeklarasikan daftar `GoRoute` di dalam `GoRouter`, mendukung pola URL, nested routes, redirect, dan guard dengan struktur yang lebih rapi serta skalabel.


## Screenshot dan Testing

Aplikasi dengan go_router memiliki fungsionalitas yang sama dengan implementasi sebelumnya:

- Hero animation tetap berfungsi dengan baik
- Navigation antar halaman smooth
- Data passing bekerja dengan sempurna
- UI components tetap sama dan responsive

![go router testing](img/gorouterfinal.gif)

Implementasi go_router ini memberikan fondasi yang lebih solid untuk pengembangan aplikasi Flutter yang lebih kompleks, terutama jika nantinya akan dikembangkan menjadi web application atau memerlukan nested routing.