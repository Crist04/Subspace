import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subspace/models/blog_model.dart';
import 'package:subspace/utils/enums.dart';

class BlogsNotifier extends ChangeNotifier{


  late BlogModel _blog;
  BlogModel get blog => _blog;

  ApiStatus _apiStatus = ApiStatus.initial;
  ApiStatus get apiStatus => _apiStatus;

  void _setApiStatus(ApiStatus apiStatus, {bool notify = true}) {
    _apiStatus = apiStatus;
    if (notify) notifyListeners();
  }

  void fetchBlogs(bool notify) async {
    _setApiStatus(ApiStatus.loading,notify: notify);
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
      _blog=BlogModel.fromJson(jsonDecode(response.body));
      _setApiStatus(ApiStatus.success);
    } else {
      print('Request failed with status code: ${response.statusCode}');
      print('Response data: ${response.body}');
      _setApiStatus(ApiStatus.error);
    }
  } catch (e) {
    print('Error: $e');
     _setApiStatus(ApiStatus.error);
  }
}
}