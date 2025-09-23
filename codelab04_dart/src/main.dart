void main() {
  // Praktikum 1
  // Langkah 1 - Membuat List
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // Langkah 2 - Membuat final List
  // final List list = List.filled(5, null);

  // list[0] = 'Tionusa Catur Pamungkas';
  // list[1] = '2341720093';

  // print(list);

  // Praktikum 2
  // Langkah 1 - Membuat Set
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  // Langkah 2 - Membuat empty Set
  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  // print(names1);
  // print(names2);
  // print(names3);

  // Langkah 3 - Menambahkan elemen pada Set
  // names1.add('Tionusa');
  // names1.addAll(['2341720093']);

  // names2.add('Tionusa Catur Pamungkas');
  // names2.addAll(['2341720093']);

  // print(names1);
  // print(names2);

  // Praktikum 3
  // Langkah 1 - Membuat Map
  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 1
  // };

  // var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  // print(gifts);
  // print(nobleGases);

  // var mhs1 = Map<String, String>();
  // mhs1['nama'] = 'Tionusa Catur Pamungkas';
  // mhs1['nim'] = '2341720093';

  // gifts['first'] = 'partridge';
  // gifts['second'] = 'turtledoves';
  // gifts['fifth'] = 'golden rings';
  // gifts['nama'] = 'Tionusa Catur Pamungkas';
  // gifts['nim'] = '2341720093';

  // var mhs2 = Map<int, String>();
  // mhs2[1] = 'Tionusa Catur Pamungkas';
  // mhs2[2] = '2341720093';

  // nobleGases[2] = 'helium';
  // nobleGases[10] = 'neon';
  // nobleGases[18] = 'argon';
  // nobleGases[19] = 'Tionusa Catur Pamungkas';
  // nobleGases[20] = '2341720093';

  // print(mhs1);
  // print(mhs2);
  // print(gifts);
  // print(nobleGases);

  // Praktikum 4
  // Langkah 4 - Spread Operator dan Collection If
  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

  // var list1 = [1, 2, null];
  // print(list1);

  // var list3 = [0, ...?list1];
  // print(list3.length);

  // var nim = [2341720093];
  // var list4 = [...nim];
  // print(list4);

  // bool promoActive = true;
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // promoActive = false;
  // nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // Langkah 5 - Collection Case
  // var login = 'Customer';

  // var nav2 = [
  //   'Home',
  //   'Furniture',
  //   'Plants',
  //   if (login case 'Manager') 'Inventory'
  // ];
  // print(nav2);

  // Langkah 6 - Collection For
  // var listOfInts = [1, 2, 3];
  // var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  // assert(listOfStrings[1] == '#1');
  // print(listOfStrings);

  // Praktikum 5
  // Langkah 2 - Membuat Record
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);
  // print(record.$1); // Mengakses elemen pertama
  // print(record.a); // Mengakses elemen dengan nama 'a'
  // print(record.b); // Mengakses elemen dengan nama 'b'

  // Langkah 3 - Destructuring Record
  // var record = (1, 2);
  // print('Sebelum ditukar: $record');

  // // Memanggil fungsi tukar untuk menukar nilai dalam record
  // var hasilTukar = tukar(record);
  // print('Setelah ditukar: $hasilTukar');

  // Langkah 4 - Record Type Annotation
  // // Record type annotation in a variable declaration:
  // (String, int) mahasiswa;
  // mahasiswa = ('Tionusa Catur Pamungkas', 2341720093);
  // print(mahasiswa);

  // Langkah 5 - Record with Named Fields
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  // print(mahasiswa2.$1); // Prints 'first'
  // print(mahasiswa2.a); // Prints 2
  // print(mahasiswa2.b); // Prints true
  // print(mahasiswa2.$2); // Prints 'last'

  mahasiswa2 = ('Tionusa Catur Pamungkas', a: 2, b: true, '2341720093');
  print(mahasiswa2.$1); // Prints 'Tionusa Catur Pamungkas'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints '2341720093'
}

// (int, int) tukar((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }
