import 'package:flutter/material.dart';

import 'build_list/build_list.dart';
import 'build_top/build_top.dart';

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BuildTop(),
        Expanded(
          child: BuildList(),
        ),
      ],
    );
  }
}
