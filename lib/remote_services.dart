import 'package:flutter/foundation.dart';
import 'package:restapi/post.dart';
import 'package:http/http.dart' as http;
class RemoteService{
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri =Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if(response.statusCode==200){
     // var json=response.body;
      final json = await compute(postFromJson, response.body.toString());
      return postFromJson(json.toString());
    }
   // return null;
  }
}