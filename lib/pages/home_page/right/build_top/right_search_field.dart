import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:excell_creater/providers/providers.dart';

class RightSearchField extends HookConsumerWidget {
  const RightSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          ref.read(exportListProvider.notifier).typeSearchPattern(value);
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search with barcode",
        ),
      ),
    );
  }
}
