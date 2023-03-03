import 'item.dart';

class Order {
  final String description;
  final List<Item> items;

  Order({required this.description, required this.items});

  Order copyWith({String? name, List<Item>? items}) => Order(description: name ?? this.description, items: items ?? this.items);
}
