import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view/base_view.dart';
import 'package:flutter_application_1/homepage/viewmodel/home_page_view_model.dart';
import 'package:flutter_application_1/widgets/home_page/twitter_home_page.dart';
import 'package:flutter_application_1/widgets/search_bar/search_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = HomePageViewModel();
    return BaseView<HomePageViewModel>(
      viewModel: _viewModel,
      setupViewModel: (viewModel) => viewModel.initialize(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: TwitterHomePageBaseWidget(
            attributes: TwitterHomePageBaseWidgetAttributes(
              weetList: viewModel.getTweetList(),
              searchBarAttributes: SearchBarWidgetAttributes(
                hintText: 'Search',
                onChanged: viewModel.onSearchTextChanged,
              ),
            ),
          ),
        );
      },
    );
  }
}
