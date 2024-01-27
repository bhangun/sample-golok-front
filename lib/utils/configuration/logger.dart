

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

setupLogger(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}