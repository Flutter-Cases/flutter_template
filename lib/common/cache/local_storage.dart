import 'dart:convert';

import 'package:flutter_template/entity/jwt_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences _prefs;
  static JwtEntity _jwtEntity;
  static var _jwtExist = true;

  static Future _newInstance() async {
    if (null == _prefs) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  static Future set(String key, dynamic value) async {
    try {
      SharedPreferences prefs = await _newInstance();
      prefs.setString(key, json.encode(value));
      return true;
    } catch (e) {
      print("set:${e}");
      return false;
    }
  }

  static Future get(String key, {dynamic entity}) async {
    try {
      SharedPreferences prefs = await _newInstance();
      return json.decode(prefs.get(key));
    } catch (e) {
      print("get:${e}");
      return null;
    }
  }

  static Future setJwt(JwtEntity jwt) {
    _jwtEntity = jwt;
    _jwtExist = true;
    set('jwt', jwt);
  }

  static Future getJwt() async {
    if (!_jwtExist) {
      return null;
    }
    if (null != _jwtEntity) {
      return _jwtEntity;
    }
    dynamic jwtJson = await get('jwt');
    if (null != jwtJson) {
      _jwtEntity = JwtEntity.fromJson(jwtJson);
      return _jwtEntity;
    }
    _jwtExist = false;
    return null;
  }

  static Future clearJwt() {
    _jwtExist = false;
    _jwtEntity = null;
    remove('jwt');
  }

  static Future remove(String key) async {
    try {
      SharedPreferences prefs = await _newInstance();
      prefs.remove(key);
    } catch (e) {
      print("remove:${e}");
    }
  }

  static Future clear() async {
    try {
      SharedPreferences prefs = await _newInstance();
      prefs.clear();
    } catch (e) {
      print("clear:${e}");
    }
  }
}
