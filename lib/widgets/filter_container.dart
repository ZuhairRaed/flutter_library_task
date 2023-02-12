import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/poppins_text.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: widget.isSelected == true ? const Color(0xff009BA6) : Colors.transparent,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          width: 1,
          color: const Color(0xff009BA6)
        )
      ),
      child: PoppinsText(text: widget.text, 
      color: widget.isSelected == true ? const Color(0xffFFFFFF) : const Color(0xff009BA6),
      size: 15,),
    );
  }
}