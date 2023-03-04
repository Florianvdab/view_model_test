import 'item.dart';

class Order {
  final String description;
  final List<Item> items;

  Order({required this.description, required this.items});

  Order copyWith({String? description, List<Item>? items}) =>
      Order(description: description ?? this.description, items: items ?? this.items);
}
