import 'package:logger/logger.dart';


var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 150, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  ), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);

/// show only specific log levels
void updateLoggerLevel(Level level) {
  Logger.level = level;
}

void loggerLevelV(dynamic message) {
  logger.v(message);
}

void loggerLevelD(dynamic message) {
  logger.d(message);
}

void loggerLevelI(dynamic message) {
  logger.i(message);
}

void loggerLevelW(dynamic message) {
  logger.w(message);
}

void loggerLevelE(dynamic message) {
  logger.e(message);
}

void loggerLevelWTF(dynamic message) {
  logger.wtf(message);
}