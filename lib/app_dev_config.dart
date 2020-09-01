import 'package:flutter_template/app_config.dart';

class AppDevConfig {
  /// log
  final bool logDebug = true;
  final bool logInfo = true;
  final bool logWarn = true;
  final bool logError = true;

  /// http
  final String httpApiPrefix = "http://192.168.8.100:8080";
  final int httpConnectTimeout = 15 * 1000;

  /// wechat
  final bool weChatEnable = true;
  final bool weChatOnIOS = true;
  final bool weChatOnAndroid = true;
  final String weChatAppId = 'wx7052e9a6387627c9';
  final String weChatUniversalLink = 'https://www.sjzmjy.cn';

  /// umeng
  final bool umengEnable = true;
  final String umengIOSKey = "5e7082100cafb2bede000273";
  final String umengAndroidKey = "5e708188570df34428000113";
  final String umengChannel = "umeng";
  final bool umengReportCrash = false;
  final bool umengLogEnable = true;
  final bool umengEncrypt = true;
}
