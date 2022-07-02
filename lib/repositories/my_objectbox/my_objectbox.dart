import 'package:excell_creater/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

late Store myStore;

Future<void> initializeObjectBox() async {
  final dir = await getApplicationSupportDirectory();
  myStore = await openStore(directory: join(dir.path, "excell_creater"));
}
