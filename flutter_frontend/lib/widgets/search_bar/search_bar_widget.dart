import 'package:flutter/material.dart';

class SearchBarWidgetAttributes {
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;

  SearchBarWidgetAttributes({
    this.hintText,
    this.contentPadding,
    this.onChanged,
  });
}

class SearchBarWidget extends StatelessWidget {
  final SearchBarWidgetAttributes attributes;
  const SearchBarWidget({
    required this.attributes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey),
      child: Row(
        children: [
          Container(
            padding: attributes.contentPadding,
            height: 40,
            width: MediaQuery.of(context).size.width - 50,
            child: Center(
              child: TextFormField(
                onChanged: attributes.onChanged,
                decoration: InputDecoration.collapsed(
                  hintText: attributes.hintText,
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/icons/ic_search.png',
          ),
        ],
      ),
    );
  }
}
