import 'package:gameware/models/User.dart';

class Product {
  Product({
    this.name,
    this.quantity,
    this.category,
    this.code,
    this.user,
  });
  
  final String name;
  final int quantity;
  final ProductCategory category;
  final String code;
  final User user;

  factory Product.map(dynamic obj) {
    return new Product(
      name: obj["name"],
      quantity: obj["quantity"],
      category: obj["category"],
      code: obj["code"],
      user: new User(
        id: obj['user.id'],
        name: obj['user.name'],
        email: obj['user.email'],
        username: obj['user.username'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["name"] = name;
    map["quantity"] = quantity;
    map["category"] = category;
    map["code"] = code;
    map['userId'] = user.id;

    return map;
  }
}

enum ProductCategory {
  console,
  joystick,
  cable,
  game,
}