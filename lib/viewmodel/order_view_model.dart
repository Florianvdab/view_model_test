import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:view_model_test/model/item.dart';

import '../model/order.dart';

class OrderViewModel {
  late final Order _order;
  late final TextEditingController _orderDescriptionController;
  final _itemController = StreamController<Item>();

  Order get order => _order;
  TextEditingController get nameController => _orderDescriptionController;
  Stream<Item> get itemController => _itemController.stream;

  OrderViewModel() {
    fetchData();
  }

  void fetchData() async {
    _order = await Future.value(Order(description: "name", items: []));
    _orderDescriptionController = TextEditingController(text: _order.description);
    for (var item in _order.items) {
      _itemController.add(item);
    }
  }

  void dispose() {
    _itemController.close();
  }
}
