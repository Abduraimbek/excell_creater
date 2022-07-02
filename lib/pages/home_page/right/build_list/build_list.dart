import 'package:excell_creater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:excell_creater/repositories/repositories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:excell_creater/providers/providers.dart';

class BuildList extends HookConsumerWidget {
  const BuildList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(exportListProvider);
    final length = list.length;

    return ListView.separated(
      itemBuilder: (context, index) {
        final item = list[index];

        String title = "${item.name}   [${item.barcode}]";
        String subtitle =
            "Price: ${item.price}                   In Stock: ${item.inStock}";

        return ListTile(
          onTap: () {
            NewItemDialog().show(
              exportModel: item,
              newItemDialogEnum: NewItemDialogEnum.itemEdit,
            );
          },
          leading: Text("${length - index}"),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: IconButton(
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Item?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (result == true) {
                myStore.box<ExportModel>().remove(item.id);
              }
            },
            icon: const Icon(Icons.delete_outline),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(thickness: 1, height: 1),
      itemCount: length,
    );
  }
}
