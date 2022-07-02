import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:excell_creater/providers/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: non_constant_identifier_names
FocusNode SCANNING_FOCUS_NODE = FocusNode();

class ItemScanField extends HookConsumerWidget {
  const ItemScanField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return TextField(
      onSubmitted: (value) {
        ref.read(enteringItemListProvider.notifier).onItemScanned(value);
        controller.clear();
        SCANNING_FOCUS_NODE.requestFocus();
      },
      controller: controller,
      focusNode: SCANNING_FOCUS_NODE,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Scan Barcode",
      ),
    );
  }
}
