class CartManager {
  // List to store added products

  List<AddedProduct> _addedProducts = [];

  // Getter for accessing addedProducts
  List<AddedProduct> get addedProducts => _addedProducts;

  // Function to add a product to the cart
  void addProduct(AddedProduct product) {
    // Check if a product with the same name and size exists in the cart
    final existingProductIndex = _addedProducts.indexWhere(
      (addedProduct) =>
          addedProduct.productName == product.productName &&
          addedProduct.size == product.size,
    );

    if (existingProductIndex != -1) {
      // If the product already exists, increase its quantity
      _addedProducts[existingProductIndex].quantity += product.quantity;
      _addedProducts[existingProductIndex].price += product.price;
    } else {
      // If the product doesn't exist, add it to the cart
      _addedProducts.add(product);
    }
  }

  void deductQuantity(int index) {
    if (index >= 0 && index < _addedProducts.length) {
      final product = _addedProducts[index];

      if (product.quantity > 1) {
        // Decrease the quantity by 1
        product.quantity--;

        // Adjust the price
        product.price -= (product.price / (product.quantity + 1));
      } else if (product.quantity == 1) {
        // If quantity is 1, remove the product from the cart
        removeProduct(index);
      }
    }
  }

  // Function to remove a product from the cart
  void removeProduct(int index) {
    _addedProducts.removeAt(index);
  }

  // Function to clear the cart
  void clearCart() {
    _addedProducts.clear();
  }

  double calculateTotalPrice() {
    double total = 0.0;

    for (AddedProduct product in _addedProducts) {
      total += product.price;
    }

    return total;
  }

  // Singleton instance for CartManager
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();
}

class AddedProduct {
  final String imagePath;
  final String productName;
  double price;
  final String size;
  int quantity;

  AddedProduct(
      this.productName, this.price, this.quantity, this.imagePath, this.size);
}
