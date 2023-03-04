class Item {
  String description;

  Item({required this.description});

  Item copyWith({String? description}) => Item(description: description ?? this.description);
}
