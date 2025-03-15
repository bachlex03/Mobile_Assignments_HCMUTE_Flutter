import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  double width;
  List<String> items;

  DropdownWidget({required this.width, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      width: width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        underline: Container(),
        value: items.first,
        // style: const TextStyle(color: Colors.white, fontSize: 20),
        onChanged: (_) {},
        items:
            items.map((e) {
              return DropdownMenuItem<String>(value: e, child: Text(e));
            }).toList(),
        dropdownColor: Color.fromRGBO(53, 53, 53, 1.0),
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
