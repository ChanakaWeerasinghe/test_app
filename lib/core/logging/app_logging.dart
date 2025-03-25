import 'package:logging/logging.dart';

final Logger logger = Logger('logger');

void setupLogging() {
  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((LogRecord record) {
    logger.fine(
      '${record.time} [${record.level.name}] (${record.loggerName}): ${record.message}',
    );
    if (record.error != null) {
      logger.fine('Error: ${record.error}');
    }
    if (record.stackTrace != null) {
      logger.fine('StackTrace: ${record.stackTrace}');
    }
  });
}
