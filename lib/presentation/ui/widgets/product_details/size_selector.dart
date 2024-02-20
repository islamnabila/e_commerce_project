import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.onChange, required this.sizes});
  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSizes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSizes = widget.sizes.first;
    widget.onChange(_selectedSizes);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.sizes
            .map((c) => InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _selectedSizes = c;
            widget.onChange;
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey),
                  color:c ==_selectedSizes ? AppColors.primaryColor : null ),
              child: Text(c, style: TextStyle(
                color: c ==_selectedSizes ? Colors.white : Colors.black,
              ),)
          ),
        ))
            .toList());
  }
}