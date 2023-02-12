import 'package:flutter/cupertino.dart';
import 'package:flutter_library_task/widgets/filter_container.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key, required this.list});
  final List<FilterContainer> list;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index){
        return widget.list[index];
      }),
    );
  }
}