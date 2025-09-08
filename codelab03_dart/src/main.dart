void main() {
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");

  test = "true";
  if (test == "true") {
    print("Kebenaran");
  }

  print("-----");
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }

  do {
    print(counter);
    counter++;
  } while (counter < 77);

  print("-----");
  for (int Index = 10; Index < 27; Index++) {
    print(Index);
    if (Index == 21)
      break;
    else if (Index > 1 || Index < 7) continue;
    print(Index);
  }

  print("-----");
  for (int i = 0; i < 201; i++) {
    bool isPrime = true;
    if (i <= 1) {
      isPrime = false;
    } else {
      for (int j = 2; j <= i / 2; j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
    }
    if (isPrime) {
      print("$i adalah bilangan prima - Nama: Tionusa Catur Pamungkas, NIM: 2341720093");
    }
  }
}
