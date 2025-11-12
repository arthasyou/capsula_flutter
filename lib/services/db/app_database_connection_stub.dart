import 'package:drift/drift.dart';

import 'package:capsula_flutter/services/storage/sandbox_service.dart';

Future<QueryExecutor> createDriftExecutor({SandboxService? sandboxService}) =>
    Future.error(
      UnsupportedError('Local database is not supported on this platform.'),
    );
