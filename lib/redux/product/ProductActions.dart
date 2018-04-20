import 'package:gameware/models/Product.dart';

class AddProductToList {
  AddProductToList(this.product);

  final Product product;
}

class RemoveProductFromList {
  RemoveProductFromList(this.product);

  final Product product;
}

class SetCurrentProduct {
  SetCurrentProduct(this.product);

  final Product product;
}

class UnsetCurrentProduct {}

class RemoveAllProducts {}

class ErrorSettingProductAction {}