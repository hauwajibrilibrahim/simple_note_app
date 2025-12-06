import 'package:flutter/material.dart';
import 'package:note_app/utils/constant.dart';

class ColorSelector extends StatefulWidget {
  final String selectedColor;
  final Function(String) onColorSelected;

  const ColorSelector({
    Key? key,
    required this.selectedColor,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Left arrow
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.grey),
            onPressed: _scrollLeft,
          ),

          // Color circles
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.noteColors.length,
              itemBuilder: (context, index) {
                final color = AppConstants.noteColors[index];
                final colorHex = AppConstants.getHexFromColor(color);
                final isSelected = colorHex == widget.selectedColor;

                return GestureDetector(
                  onTap: () => widget.onColorSelected(colorHex),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: isSelected
                          ? Border.all(color: Colors.white70, width: 3)
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),

          // Right arrow
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.grey),
            onPressed: _scrollRight,
          ),
        ],
      ),
    );
  }
}
