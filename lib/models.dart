import 'dart:convert';
import 'package:hocgiaoly_v1/data.dart';

class ListItem {
  List<Items>? _items;

  ListItem({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  ListItem.fromJson() {

    // String _raw = File(Assets.rawsData).readAsStringSync();
    String _raw = data;
    var _data = json.decode(_raw.trim());
    if (_data['item'] != null) {
      _items = <Items>[];
      _data['item'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  String? _question;
  String? _answer;

  Items({String? question, String? answer}) {
    if (question != null) {
      this._question = question;
    }
    if (answer != null) {
      this._answer = answer;
    }
  }

  String? get question => _question;
  set question(String? question) => _question = question;
  String? get answer => _answer;
  set answer(String? answer) => _answer = answer;

  Items.fromJson(Map<String, dynamic> json) {
    _question = json['question'];
    _answer = json['answer'];
  }
}
