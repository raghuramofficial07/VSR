
// lib/ios/screens/text_holder.dart
import 'package:flutter/cupertino.dart';
import '../model/clipboard_model.dart';

class IOSTextHolderScreen extends StatefulWidget {
  const IOSTextHolderScreen({super.key});

  @override
  State<IOSTextHolderScreen> createState() => _IOSTextHolderScreenState();
}

class _IOSTextHolderScreenState extends State<IOSTextHolderScreen> {
  final ClipboardModelIOS _model = ClipboardModelIOS();
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Clipboard — iOS'),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      controller: _controller,
                      placeholder: 'Enter text to store…',
                      onSubmitted: (_) => _add(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    onPressed: _add,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _model.items.isEmpty
                  ? const Center(child: Text('No items yet. Add something.'))
                  : ListView.builder(
                      itemCount: _model.items.length,
                      itemBuilder: (context, index) {
                        final item = _model.items[index];
                        return Dismissible(
                          key: ValueKey('ios_$index$item'),
                          background: Container(color: CupertinoColors.systemRed),
                          onDismissed: (_) {
                            setState(() => _model.removeAt(index));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: CupertinoColors.separator, width: 0.5),
                              ),
                            ),
                            child: Text(item),
                          ),
                        );
                      },
                    ),
            ),
            if (_model.items.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoButton(
                  onPressed: () => setState(_model.clear),
                  child: const Text('Clear All'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
