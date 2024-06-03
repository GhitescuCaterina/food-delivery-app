class Order {
  final String imageUrl;
  final String name;
  final double price;
  final DateTime date;
  final String status;
  final List<OrderItem> items;

  Order({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.date,
    required this.status,
    required this.items,
  });
}

class OrderItem {
  final String name;
  final double price;
  final int quantity;

  OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String location;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.location,
  });
}

class Cart {
  static List<CartItem> items = [];

  static void addItem(OrderItem item, String location) {
    items.add(CartItem(
      name: item.name,
      price: item.price,
      quantity: item.quantity,
      location: location,
    ));
  }
}
