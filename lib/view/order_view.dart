import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_model_test/viewmodel/order_view_model.dart';

import '../model/order.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context);
    var nameController = viewModel.descriptionController;

    return Column(
      children: [
        StreamBuilder<Order>(
          stream: viewModel.orderController,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: Column(
              children: [
                TextButton(onPressed: () => viewModel.createItem(), child: const Text("Add Item")),
                TextFormField(controller: nameController, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                for (var x in snapshot.requireData.items) Text(x.description),
              ],
            ));
          },
        ),
      ],
    );
  }
}
