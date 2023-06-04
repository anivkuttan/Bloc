class User {
  final String name;
  final int age;
  final int? number;
  final String? address;

  User({
    required this.name,
    required this.age,
    this.number,
    this.address,
  });
}
