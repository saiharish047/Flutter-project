import 'package:flutter/material.dart';

class SettingsOverlayWidget extends StatelessWidget {
  const SettingsOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              child: const Text(
                '#Explore',
                style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
