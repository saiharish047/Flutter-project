import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view/base_view.dart';
import 'package:flutter_application_1/homepage/viewmodel/home_page_view_model.dart';

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
          body: Column(
            children: [
              const SizedBox(height: 100),
              Text(viewModel.getText()),
              ElevatedButton(
                onPressed: viewModel.onTap,
                child: const Text('Press here'),
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.navigate(context);
                  },
                  child: Text('Navigate'))
            ],
          ),
        );
      },
    );
  }
}
