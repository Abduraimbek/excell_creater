import 'package:excell_creater/providers/providers.dart';
import 'package:excell_creater/repositories/repositories.dart';
import 'package:excell_creater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'right_search_field.dart';

class BuildTop extends StatelessWidget {
  const BuildTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const RightSearchField(),
          const SizedBox(width: 20),
          OutlinedButton(
            onPressed: () {
              NewItemDialog().show(
                exportModel: null,
                newItemDialogEnum: NewItemDialogEnum.itemCreate,
              );
            },
            child: const Icon(Icons.add_outlined),
          ),
          const SizedBox(width: 20),
          Consumer(
            builder: (context, ref, _) {
              return OutlinedButton(
                onPressed: () {
                  ref.read(exportListProvider.notifier).export();
                },
                child: const Icon(Icons.cloud_upload_outlined),
              );
            },
          ),
          const SizedBox(width: 20),
          OutlinedButton(
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete All?"),
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
                myStore.box<ExportModel>().removeAll();
              }
            },
            child: const Icon(Icons.delete_forever_outlined),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
