import 'package:flutter/material.dart';
import 'package:excell_creater/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'left/left.dart';
import 'right/right.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, _) {
            return Text("Items ${ref.watch(enteringItemListProvider).length}");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(enteringItemListProvider.notifier).readFile();
            },
            icon: const Icon(Icons.file_open),
          ),
        ],
      ),
      body: Row(
        children: const [
          Expanded(child: Left()),
          SizedBox(width: 50),
          Expanded(child: Right()),
        ],
      ),
    );
  }
}
