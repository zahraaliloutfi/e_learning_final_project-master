
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global/utill/colors.dart';

class Genaral_ListTile extends StatefulWidget {
  Genaral_ListTile({
    super.key,
    required this.title, this.function, required this.icon,
  });

  late String title;
  final function;
  final IconButton icon;

  @override
  State<Genaral_ListTile> createState() => _Genaral_ListTileState();
}

class _Genaral_ListTileState extends State<Genaral_ListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.function,
        child: ListTile(
          title: Text(
            widget.title,
            style:  TextStyle(
              color: ColorResources.textColor(context),
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
              fontSize: 20,
            ),
          ),
          trailing: IconButton(
            onPressed: widget.function,
            icon: widget.icon,
          ),
        ),
      ),
    );
  }
}