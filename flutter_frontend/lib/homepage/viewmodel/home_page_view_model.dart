import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';
import 'package:flutter_application_1/homepage/data_provider/home_page_data_provider.dart';
import 'package:flutter_application_1/homepage/model/weet_model.dart';

class HomePageViewModel extends BaseViewModel {
  final _dataProvider = HomePageDataProvider();
  late List<WeetModel> _fullWeetList;
  late List<WeetModel> _weetList;

  HomePageViewModel() : super();
  void initialize() {
    _fullWeetList = _dataProvider.getTweets();
    _weetList = _fullWeetList;
  }

  List<WeetModel> getTweetList() {
    return _weetList;
  }

  void onSearchTextChanged(String value) {
    if (value == '') {
      _weetList = _fullWeetList;
    }

    var list = <WeetModel>[];
    _fullWeetList.forEach((weet) {
      if (weet.title.toLowerCase().contains(value.toLowerCase())) {
        list.add(weet);
      }
    });
    _weetList = list;

    notifyListeners();
  }
}
