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

class Cart {
  static final List<OrderItem> _items = [];

  static void addItem(OrderItem item) {
    _items.add(item);
  }

  static List<OrderItem> get items => _items;

  static void clear() {
    _items.clear();
  }
}
