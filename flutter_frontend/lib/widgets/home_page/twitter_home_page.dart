import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/model/weet_model.dart';
import 'package:flutter_application_1/widgets/search_bar/search_bar_widget.dart';

class TwitterHomePageBaseWidgetAttributes {
  List<WeetModel> weetList;
  SearchBarWidgetAttributes searchBarAttributes;

  TwitterHomePageBaseWidgetAttributes({
    required this.weetList,
    required this.searchBarAttributes,
  });
}

class TwitterHomePageBaseWidget extends StatefulWidget {
  final TwitterHomePageBaseWidgetAttributes attributes;

  const TwitterHomePageBaseWidget({required this.attributes, Key? key}) : super(key: key);

  @override
  State<TwitterHomePageBaseWidget> createState() => _TwitterHomePageBaseWidgetState();
}

class _TwitterHomePageBaseWidgetState extends State<TwitterHomePageBaseWidget> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisSize: MainAxisSize.max,
    //   children: [
    //     const SizedBox(
    //       height: 60,
    //     ),
    //     SearchBarWidget(
    //       attributes: widget.attributes.searchBarAttributes,
    //     ),
    return LayoutBuilder(
      builder: (context, viewportConstraints) => Column(children: [
        const SizedBox(
          height: 60,
        ),
        SearchBarWidget(
          attributes: widget.attributes.searchBarAttributes,
        ),
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: viewportConstraints.maxHeight - 160,
          ),
          child: SingleChildScrollView(
            child: Column(
                children: [_getTweetList(widget.attributes.weetList), _getInstaList(widget.attributes.weetList)]),
          ),
        )
      ]),
    );
  }

  Widget _getInstaList(List<WeetModel> weets) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: weets
            .map((e) => Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Card(
                    child: ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.likes.toString()),
                      trailing: Image.network('https://pbs.twimg.com/media/FPV1kgHVQAIkUoW?format=jpg&name=120x120'),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _getTweetList(List<WeetModel> weets) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          child: Card(
            child: ListTile(
              title: Text(weets[index].title),
              subtitle: Text(weets[index].likes.toString()),
              trailing: Image.network('https://pbs.twimg.com/media/FPV1kgHVQAIkUoW?format=jpg&name=120x120'),
            ),
          ),
        );
      },
      itemCount: weets.length,
    );
  }
}
