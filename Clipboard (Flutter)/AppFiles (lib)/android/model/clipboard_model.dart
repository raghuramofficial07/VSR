
// lib/android/model/clipboard_model.dart
class ClipboardModelAndroid {
  final List<String> _items = <String>[];

  List<String> get items => List.unmodifiable(_items);

  void add(String value) {
    final v = value.trim();
    if (v.isEmpty) return;
    _items.insert(0, v);
  }

  void removeAt(int index) {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
  }

  void clear() => _items.clear();
}
