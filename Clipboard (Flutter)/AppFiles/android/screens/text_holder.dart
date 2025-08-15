
// lib/android/screens/text_holder.dart
import 'package:flutter/material.dart';
import '../model/clipboard_model.dart';

class AndroidTextHolderScreen extends StatefulWidget {
  const AndroidTextHolderScreen({super.key});

  @override
  State<AndroidTextHolderScreen> createState() => _AndroidTextHolderScreenState();
}

class _AndroidTextHolderScreenState extends State<AndroidTextHolderScreen> {
  final ClipboardModelAndroid _model = ClipboardModelAndroid();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _add() {
    _model.add(_controller.text);
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter text to store…',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _add(),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _add,
                child: const Text('Add'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _model.items.isEmpty
                ? const Center(child: Text('No items yet. Add something.'))
                : ListView.builder(
                    itemCount: _model.items.length,
                    itemBuilder: (context, index) {
                      final item = _model.items[index];
                      return Dismissible(
                        key: ValueKey('android_$index$item'),
                        background: Container(color: Colors.redAccent),
                        onDismissed: (_) {
                          setState(() => _model.removeAt(index));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(item),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_model.items.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => setState(_model.clear),
                child: const Text('Clear All'),
              ),
            ),
        ],
      ),
    );
  }
}
