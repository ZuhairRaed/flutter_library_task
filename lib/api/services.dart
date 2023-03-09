import 'dart:convert';

import 'package:flutter_library_task/variabels/library.dart';
import 'package:flutter_library_task/variabels/tags.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

class ApiServices {
  String endpoint = 'https://development.himam.com/api/library/tags';

  Future<List<Tags>> getData() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => Tags.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final tagsProvider = Provider<ApiServices>((ref) => ApiServices());

class ApiServicesLibrary {
  String endpoint = 'https://development.himam.com/api/library';

  Future<List<Library>> getData() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => Library.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final libraryProvider =
    Provider<ApiServicesLibrary>((ref) => ApiServicesLibrary());
