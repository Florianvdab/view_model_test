import 'dart:async';

import 'package:flutter/material.dart';

import '../model/item.dart';
import '../model/order.dart';

class OrderViewModel {
  final TextEditingController _orderDescriptionController = TextEditingController();
  final _orderController = StreamController<Order>();
  late final Order _order;

  TextEditingController get descriptionController => _orderDescriptionController;
  Stream<Order> get orderController => _orderController.stream;

  OrderViewModel() {
    _fetchData();
  }

  void _fetchData() async {
    //Mock server request
    _order = await Future.value(Order(description: "this is a test", items: []));
    _orderController.add(_order);
    _orderDescriptionController.text = _order.description;
  }

  void createItem() {
    var items = _order.items;
    items.add(Item(description: "description"));
    _orderController.add(_order.copyWith(items: items));
  }

  void dispose() {
    _orderController.close();
  }

  /*_TODO: Figure out how to navigate to an item, edit the item and save the changes via this view model or another one specific for the item
  thoughts: 
  can I create a ViewModel for this selected item in here?
  do I need to make some kind of selectedItem getter */
}
