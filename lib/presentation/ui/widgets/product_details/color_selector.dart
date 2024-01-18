
import 'package:flutter/material.dart';

class ColorsSelector extends StatefulWidget {
  const ColorsSelector(
      {super.key, required this.colors, required this.onChange});
  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorsSelector> createState() => _ColorsSelectorState();
}

class _ColorsSelectorState extends State<ColorsSelector> {
  late Color _selectedColors;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColors = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.colors
            .map((c) => InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _selectedColors = c;
            widget.onChange;
            if (mounted) {
              setState(() {});
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: c,
              child: _selectedColors == c ? Icon(Icons.done) : null,
            ),
          ),
        ))
            .toList());
  }
}