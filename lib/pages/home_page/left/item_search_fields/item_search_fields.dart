import 'package:excell_creater/providers/providers.dart';
import 'package:excell_creater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemSearchFields extends HookConsumerWidget {
  const ItemSearchFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final nameController = useTextEditingController();
    final prNameController = useTextEditingController();
    final tradeNameController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "Product Search Fields",
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            prNameController.clear();
            tradeNameController.clear();
            ref.read(enteringItemListProvider.notifier).searchByName(value);
          },
          controller: nameController,
          decoration: myInputDecoration("Name"),
        ),
        const SizedBox(height: 15),
        TextField(
          onChanged: (value) {
            nameController.clear();
            tradeNameController.clear();
            ref.read(enteringItemListProvider.notifier).searchByPrName(value);
          },
          controller: prNameController,
          decoration: myInputDecoration("Pr Name"),
        ),
        const SizedBox(height: 15),
        TextField(
          onChanged: (value) {
            nameController.clear();
            prNameController.clear();
            ref
                .watch(enteringItemListProvider.notifier)
                .searchByTradeName(value);
          },
          controller: tradeNameController,
          decoration: myInputDecoration("Trade Name"),
        ),
      ],
    );
  }
}
