import 'lib.dart';

void main() {
  var task1 = Task1();

  print(task1.gcdList([0, 0]));
  print(task1.lcmList([0, 0]));

  print(task1.gcdList([20, 15]));
  print(task1.lcmList([3, 5]));

  print(task1.gcdList([20, 15, 625]));
  print(task1.lcmList([3, 5, 7, 9]));

  print(task1.factorize(5555));

  var task2 = Task2();

  print(task2.bin2dec('0111'));
  print(task2.dec2bin('7'));

  var task3 = Task3();
  print(task3.findNumbers(
      'hello 2021 year from 39 years old man with 3 children and 1 cat and 0.75 whiskey'));

  var task4 = Task4();
  print(task4.wordsCount(['yes', 'no', 'yes', 'no', 'no']));

  var task5 = Task5();
  print(task5.findNumbers(['one', 'two', 'three', 'cat', 'dog']));
  print(task5.findNumbers(['one', 'two', 'zero', 'zero']));

  var task6 = Point(45, 233, 450);
  print(task6.distanceTo(Point(-45, 233, 450)));
  print(Point.random().x);

  num task7 = 9;
  print(task7.root(2));

  AdminUser user = AdminUser('sobarabarabaka@gmail.com');
  print(user.getMailSystem());

  UserManager<User> userManager = UserManager([
    User('odin@gmail.com'),
    User('dva@gmail.com'),
    User('tri@gmail.com'),
    AdminUser('admin@gmail.com'),
  ]);
  print(userManager.getEmails());
}
