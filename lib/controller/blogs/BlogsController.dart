import 'dart:convert';
import 'package:vani_ashok_blogs/controller/BaseController.dart';
import 'package:vani_ashok_blogs/model/blog/BlogModel.dart';

class BlogsController extends BaseController {
  Future<List<BlogModel>> getAllBlogs() async {
    final response = await doGet('/blogs/all');
    final Map<String, dynamic> decodedResponse = jsonDecode(response);

    // Assuming the list of blogs is under the 'blogs' key
    final List<dynamic> blogsJson = decodedResponse['blogs'];

    return blogsJson.map((json) => BlogModel.fromJson(json)).toList();
  }
}