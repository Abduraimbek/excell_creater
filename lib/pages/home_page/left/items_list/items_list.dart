import 'package:excell_creater/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemsList extends HookConsumerWidget {
  const ItemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final items = ref.watch(enteringItemListProvider);

    return ListView.separated(
      controller: controller,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        String title = "${item.name} \n ${item.tradeName} \n ${item.tradeName}";
        String subtitle = item.barcode;

        return ListTile(
          onTap: () {
            ref.read(enteringItemListProvider.notifier).pressItem(item);
          },
          title: Text(title),
          subtitle: Text(subtitle),
        );
      },
      separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
    );
  }
}
