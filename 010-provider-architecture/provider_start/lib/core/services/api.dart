import 'dart:convert';
import 'dart:io';

import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    try {
      var response = await client.get('$endpoint/users/$userId').then((res) {
        print('success');
      }).catchError((Object err) {
        print('fucker');
        print(err);
        throw err;
      });

      // Convert and return
      return User.fromJson(json.decode(response.body));
    } on HttpException catch (ex) {
      print('http');
      print(ex);
      print('exception');
      return null;
    } on Object catch (e) {
      print('hello');
      print(e);
      print('world');
      var szUser =
          '{\r\n  \"id\": 5,\r\n  \"name\": \"Chelsey Dietrich\",\r\n  \"username\": \"Kamren\",\r\n  \"email\": \"Lucio_Hettinger@annie.ca\",\r\n  \"address\": {\r\n    \"street\": \"Skiles Walks\",\r\n    \"suite\": \"Suite 351\",\r\n    \"city\": \"Roscoeview\",\r\n    \"zipcode\": \"33263\",\r\n    \"geo\": {\r\n      \"lat\": \"-31.8129\",\r\n      \"lng\": \"62.5342\"\r\n    }\r\n  },\r\n  \"phone\": \"(254)954-1289\",\r\n  \"website\": \"demarco.info\",\r\n  \"company\": {\r\n    \"name\": \"Keebler LLC\",\r\n    \"catchPhrase\": \"User-centric fault-tolerant solution\",\r\n    \"bs\": \"revolutionize end-to-end systems\"\r\n  }\r\n}';
      return User.fromJson(json.decode(szUser));
    }
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await client.get('$endpoint/posts?userId=$userId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await client.get('$endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
