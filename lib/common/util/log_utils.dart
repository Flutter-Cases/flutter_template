import '../../app_config.dart';

class LogUtils {
  static void debug(msg) {
    if (AppConfig.instance.logDebug) {
      print("[DEBUG] - $msg");
    }
  }

  static void info(msg) {
    if (AppConfig.instance.logInfo) {
      print("[INFO] - $msg");
    }
  }

  static void warning(msg) {
    if (AppConfig.instance.logWarn) {
      print("[WARNING] - $msg");
    }
  }

  static void error(msg) {
    if (AppConfig.instance.logError) {
      print("[ERROR] - $msg");
    }
  }
}
