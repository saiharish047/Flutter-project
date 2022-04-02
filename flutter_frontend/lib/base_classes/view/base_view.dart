import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T) setupViewModel;
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  const BaseView({
    required this.builder,
    required this.setupViewModel,
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T _viewModel;

  _BaseViewState();

  @override
  void initState() {
    _viewModel = widget.viewModel;
    widget.setupViewModel(_viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) {
        return _viewModel;
      },
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
