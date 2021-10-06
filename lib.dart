import 'dart:math';

// Реализуйте методы вычисления НОД и НОК целых чисел. Реализуйте метод, который разбивает число на простые множители и возвращает их.

class Task1 {
  // Наибольший общий делитель для двух чисел
  int _gcd(int a, int b) {
    return b != 0 ? _gcd(b, a % b) : a;
  }

  // Наименьшее общее кратное для двух чисел
  int _lcm(int a, int b) {
    try {
      return a ~/ _gcd(a, b) * b;
    } catch (e) {
      return 0;
    }
  }

  //  Наибольшй общий делитель для массива целых чисел
  int gcdList(List<int> numbers) {
    // gcd(a,b,c,d)=gcd(gcd(gcd(a,b),c),d)
    if (numbers.isNotEmpty) {
      int last = numbers.removeLast();
      return _gcd(gcdList(numbers), last);
    }
    return 0;
  }

  //  Наименьшее общее кратное для массива целых чисел
  int lcmList(List<int> numbers) {
    // lcm(a,b,c,d)=lcm(lcm(lcm(a,b),c),d)
    if (numbers.isNotEmpty) {
      int last = numbers.removeLast();
      return _lcm(lcmList(numbers), last);
    }
    return 1;
  }

  // Разложение числа на простые множители

  List<int> factorize(int x) {
    List<int> factors = [];

    for (int i = 2; i <= sqrt(x); i++) {
      if (x % i == 0) {
        factors.add(i);
        x ~/= i;
      }
    }

    if (x != 1) {
      factors.add(x);
    }

    return factors;
  }
}

// Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.

class Task2 {
  int bin2dec(String bin) {
    int pow = 1;
    int dec = 0;
    for (var i = bin.length - 1; i >= 0; i--) {
      dec += int.parse(bin[i]) * pow;
      pow *= 2;
    }

    return dec;
  }

  String dec2bin(String dec) {
    int num = int.parse(dec);
    String bin = '';

    while (num >= 1) {
      bin = bin + (num % 2).toString();
      num ~/= 2;
      //print(num);
    }

    if (dec == '0') bin = '0';

    return _reverseStringUsingSplit(bin);
  }

  String _reverseStringUsingSplit(String input) {
    var chars = input.split('');
    return chars.reversed.join();
  }
}

// Реализуйте метод, который принимает строку слов, разделённых пробелами. Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.

class Task3 {
  List<num> findNumbers(String words) {
    List<num> result = [];
    words.split(' ').forEach((element) {
      if (num.tryParse(element) != null) {
        result.add(num.tryParse(element)!);
      }
    });
    return result;
  }
}

// Есть коллекция слов. Реализуйте метод, возвращающий Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.

class Task4 {
  Map<String, int> wordsCount(List<String> words) {
    Map<String, int> result = {};

    for (var e in words) {
      if (result.containsKey(e)) {
        result[e] = result[e]! + 1;
      } else {
        result[e] = 1;
      }
    }

    return result;
  }
}

// Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого. Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке. Однако цифры встречаются в виде английских слов от zero до nine. Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.

class Task5 {
  List<int> findNumbers(List<String> words) {
    List<int> result = [];
    List<String> numbers = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];

    for (var word in words) {
      if (numbers.contains(word) && !result.contains(numbers.indexOf(word))) {
        result.add(numbers.indexOf(word));
      }
    }

    return result;
  }
}

// Реализуйте класс Point, который описывает точку в трёхмерном пространстве. У данного класса реализуйте метод distanceTo(Point another), который возвращает расстояние от данной точки до точки в параметре. По желанию можете реализовать метод, принимающий три точки в трёхмерном пространстве и возвращающий площадь треугольника, который образуют данные точки. Реализуйте factory-конструкторы для данного класса, возвращающие начало координат, и ещё несколько на своё усмотрение (например, конструктор, возвращающий точку с координатами [1,1,1], которая определяет единичный вектор).

class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  double distanceTo(Point another) {
    return sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.z - z, 2));
  }

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.random() {
    Random rand = Random();
    return Point(rand.nextDouble() * 100, rand.nextDouble() * 100,
        rand.nextDouble() * 100);
  }
}

// Реализуйте метод, который вычисляет корень любой заданной степени из числа. Реализуйте данный метод как extension-метод для num. Алгоритм можете взять на википедии как «Алгоритм нахождения корня n-й степени». Запрещается использовать методы math. В случае когда значение вернуть невозможно, необходимо бросать исключение с описанием ошибки.

extension ExtNum on num {
  num root(num power) {
    if (this < 0) {
      throw ArgumentError('Input only positive numbers');
    }

    if (this == 1) {
      return 1;
    }

    num root = this;
    while ((this - root.pow(power)).abs() > 0.000000000000001) {
      root = 1 / power * ((power - 1) * root + this / root.pow(power - 1));
    }
    return root;
  }

  num pow(num power) {
    num result = 1;
    for (var i = 0; i < power; i++) {
      result *= this;
    }
    return result;
  }
}

// Создайте класс User, у которого есть поле email. Реализуйте два наследника данного класса AdminUser и GeneralUser. Реализуйте mixin над классом User, у которого будет метод getMailSystem, который возвращает значение из email, которое находится после @. Например, если email пользователя user@mail.ru, то данный метод вернёт mail.ru. Используйте данный миксин на AdminUser. Далее реализуйте класс UserManager<T extends User>, у которого будет храниться список пользователей и будут методы добавления или удаления их. Также в UserManager реализуйте метод, который выведет почту всех пользователей, однако если пользователь admin, будет выведено значение после @. Проверьте реализованные методы на практике.

class User {
  String email;

  User(this.email);
}

class AdminUser extends User with Email {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin Email on User {
  String getMailSystem() {
    return email.split('@').last;
  }
}

class UserManager<T extends User> {
  late List<T> _users;

  void addUser(T user) => _users.add(user);

  void delUser(T user) => _users.remove(user);

  UserManager(this._users);

  List<String> getEmails() {
    return _users
        .map((element) =>
            element is AdminUser ? element.getMailSystem() : element.email)
        .toList();
  }
}
