class Product {
  Product({
    this.name,
    this.quantity,
    this.category,
    this.code,
  });
  
  final String name;
  final int quantity;
  final ProductCategory category;
  final String code;
}

enum ProductCategory {
  console,
  joystick,
  cable,
  game,
}