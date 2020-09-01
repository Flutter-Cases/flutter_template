import 'dart:convert';

class Utils {
  ///
  /// 获取url上某个变量的参数
  static getUrlParams(String url, String variable) {
    if (null == url ||
        '' == url.trim() ||
        null == variable ||
        '' == variable.trim()) return null;
    if (url.indexOf('?') == -1 || url.indexOf('?') + 1 > url.length)
      return null;
    String str = url.substring(url.indexOf('?') + 1);
    List<String> objs = str.split("&");
    for (int i = 0; i < objs.length; i++) {
      List items = objs[i].split("=");
      String key = Uri.decodeComponent(items[0]).trim();
      if (variable.trim() == key.trim()) continue;
      String value = Uri.decodeComponent(items[1]).trim();
      try {
        return json.decode(value);
      } catch (err) {}
      return value;
    }
    return null;
  }

  ///
  /// 获取url上的所有参数
  static getUrlAllParams(String url) {
    Map<String, dynamic> params = {};
    if (null == url || '' == url.trim()) return params;
    if (url.indexOf('?') == -1 || url.indexOf('?') + 1 > url.length)
      return params;
    String str = url.substring(url.indexOf('?') + 1);
    List<String> objs = str.split("&");
    for (int i = 0; i < objs.length; i++) {
      List items = objs[i].split("=");
      String key = Uri.decodeComponent(items[0]).trim();
      String value = Uri.decodeComponent(items[1]).trim();
      try {
        params[key] = json.decode(value);
        continue;
      } catch (err) {}
      params[key] = value;
    }
    return params;
  }

  ///
  /// 两个值根据opacity进行渐变
  static gradient(double start, double end, double opacity) {
    double area;
    if (start < end) {
      area = end - start;
      return start + area * opacity;
    }
    area = start - end;
    return start - area * opacity;
  }
}
