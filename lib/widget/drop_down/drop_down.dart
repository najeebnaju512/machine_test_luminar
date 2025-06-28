import 'package:flutter/material.dart';

class CustomSearchableDropdown extends StatefulWidget {
  final List<DropDownItem> items;
  final dynamic selectedId;
  final ValueChanged<DropDownItem>? onChanged;
  final String hintText;
  final bool isDense;

  const CustomSearchableDropdown({
    super.key,
    required this.items,
    this.selectedId,
    this.onChanged,
    this.hintText = "Select",
    this.isDense = false,
  });

  @override
  State<CustomSearchableDropdown> createState() =>
      _CustomSearchableDropdownState();
}

class _CustomSearchableDropdownState extends State<CustomSearchableDropdown> {
  final TextEditingController _searchController = TextEditingController();

  DropDownItem? get _selectedItem {
    try {
      return widget.items.firstWhere((item) {
        return item.id.toString() == widget.selectedId.toString();
      }, orElse: () => DropDownItem(id: null, label: null));
    } catch (_) {
      return null;
    }
  }

  void _openDropdownDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxHeight: 400),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _searchController,
                  builder: (context, value, child) {
                    final query = _searchController.text.toLowerCase();
                    final results = widget.items
                        .where(
                          (item) =>
                              (item.label ?? '').toLowerCase().contains(query),
                        )
                        .toList();

                    if (results.isEmpty) {
                      return const Center(child: Text("No items found"));
                    }

                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final item = results[index];
                        return ListTile(
                          title: Text(item.label ?? ''),
                          onTap: () {
                            widget.onChanged?.call(item);
                            _searchController.clear();
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) => _searchController.clear());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = _selectedItem;
    final selectedLabel = selectedItem?.label ?? "";

    return InkWell(
      onTap: _openDropdownDialog,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(),
          isDense: widget.isDense,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          selectedLabel.isEmpty ? widget.hintText : selectedLabel,
          style: TextStyle(
            color: selectedLabel.isEmpty ? Colors.grey[600] : Colors.black,
          ),
        ),
      ),
    );
  }
}

class DropDownItem {
  dynamic id;
  String? label;

  DropDownItem({this.id, this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label;

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}
