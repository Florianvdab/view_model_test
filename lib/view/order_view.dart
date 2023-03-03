import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_model_test/model/item.dart';
import 'package:view_model_test/viewmodel/order_view_model.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context);
    var nameController = viewModel.nameController;

    return Column(
      children: [
        TextFormField(controller: nameController),
        StreamBuilder<Item>(
          stream: viewModel.itemController,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: Column(
              children: [Text(snapshot.requireData.description)],
            ));
          },
        ),
      ],
    );
  }
}
