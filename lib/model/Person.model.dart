import 'package:bonus/enum/Gender.enum.dart';

class Person {
  Gender gender;
  int weigh;
  double height;
  int age;
  Person({required this.gender, required this.weigh, required this.height, required this.age});
}
