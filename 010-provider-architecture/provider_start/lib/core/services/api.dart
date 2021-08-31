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
    // try {
    //   var response = await client.get('$endpoint/users/$userId').then((res) {
    //     print('success');
    //   }).catchError((Object err) {
    //     print('fucker');
    //     print(err);
    //     throw err;
    //   });

    //   // Convert and return
    //   return User.fromJson(json.decode(response.body));
    // } on HttpException catch (ex) {
    //   print('http');
    //   print(ex);
    //   print('exception');
    //   return null;
    // } on Object catch (e) {
    //   print('hello');
    //   print(e);
    //   print('world');
    //   var szUser =
    //       '{\r\n  \"id\": 5,\r\n  \"name\": \"Chelsey Dietrich\",\r\n  \"username\": \"Kamren\",\r\n  \"email\": \"Lucio_Hettinger@annie.ca\",\r\n  \"address\": {\r\n    \"street\": \"Skiles Walks\",\r\n    \"suite\": \"Suite 351\",\r\n    \"city\": \"Roscoeview\",\r\n    \"zipcode\": \"33263\",\r\n    \"geo\": {\r\n      \"lat\": \"-31.8129\",\r\n      \"lng\": \"62.5342\"\r\n    }\r\n  },\r\n  \"phone\": \"(254)954-1289\",\r\n  \"website\": \"demarco.info\",\r\n  \"company\": {\r\n    \"name\": \"Keebler LLC\",\r\n    \"catchPhrase\": \"User-centric fault-tolerant solution\",\r\n    \"bs\": \"revolutionize end-to-end systems\"\r\n  }\r\n}';
    //   return User.fromJson(json.decode(szUser));
    // }

    await Future.delayed(Duration(seconds: 2));
    var szUser =
        '{\r\n  \"id\": 5,\r\n  \"name\": \"Chelsey Dietrich\",\r\n  \"username\": \"Kamren\",\r\n  \"email\": \"Lucio_Hettinger@annie.ca\",\r\n  \"address\": {\r\n    \"street\": \"Skiles Walks\",\r\n    \"suite\": \"Suite 351\",\r\n    \"city\": \"Roscoeview\",\r\n    \"zipcode\": \"33263\",\r\n    \"geo\": {\r\n      \"lat\": \"-31.8129\",\r\n      \"lng\": \"62.5342\"\r\n    }\r\n  },\r\n  \"phone\": \"(254)954-1289\",\r\n  \"website\": \"demarco.info\",\r\n  \"company\": {\r\n    \"name\": \"Keebler LLC\",\r\n    \"catchPhrase\": \"User-centric fault-tolerant solution\",\r\n    \"bs\": \"revolutionize end-to-end systems\"\r\n  }\r\n}';
    return User.fromJson(json.decode(szUser));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    print('$endpoint/posts?userId=$userId');
    try {
      // var response = await client.get('$endpoint/posts?userId=$userId');
      await Future.delayed(Duration(seconds: 5));
    } catch (error) {
      print(error);
    }

    String szPosts =
        '[\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 21,\r\n    \"title\": \"asperiores ea ipsam voluptatibus modi minima quia sint\",\r\n    \"body\": \"repellat aliquid praesentium dolorem quo\\nsed totam minus non itaque\\nnihil labore molestiae sunt dolor eveniet hic recusandae veniam\\ntempora et tenetur expedita sunt\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 22,\r\n    \"title\": \"dolor sint quo a velit explicabo quia nam\",\r\n    \"body\": \"eos qui et ipsum ipsam suscipit aut\\nsed omnis non odio\\nexpedita earum mollitia molestiae aut atque rem suscipit\\nnam impedit esse\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 23,\r\n    \"title\": \"maxime id vitae nihil numquam\",\r\n    \"body\": \"veritatis unde neque eligendi\\nquae quod architecto quo neque vitae\\nest illo sit tempora doloremque fugit quod\\net et vel beatae sequi ullam sed tenetur perspiciatis\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 24,\r\n    \"title\": \"autem hic labore sunt dolores incidunt\",\r\n    \"body\": \"enim et ex nulla\\nomnis voluptas quia qui\\nvoluptatem consequatur numquam aliquam sunt\\ntotam recusandae id dignissimos aut sed asperiores deserunt\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 25,\r\n    \"title\": \"rem alias distinctio quo quis\",\r\n    \"body\": \"ullam consequatur ut\\nomnis quis sit vel consequuntur\\nipsa eligendi ipsum molestiae et omnis error nostrum\\nmolestiae illo tempore quia et distinctio\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 26,\r\n    \"title\": \"est et quae odit qui non\",\r\n    \"body\": \"similique esse doloribus nihil accusamus\\nomnis dolorem fuga consequuntur reprehenderit fugit recusandae temporibus\\nperspiciatis cum ut laudantium\\nomnis aut molestiae vel vero\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 27,\r\n    \"title\": \"quasi id et eos tenetur aut quo autem\",\r\n    \"body\": \"eum sed dolores ipsam sint possimus debitis occaecati\\ndebitis qui qui et\\nut placeat enim earum aut odit facilis\\nconsequatur suscipit necessitatibus rerum sed inventore temporibus consequatur\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 28,\r\n    \"title\": \"delectus ullam et corporis nulla voluptas sequi\",\r\n    \"body\": \"non et quaerat ex quae ad maiores\\nmaiores recusandae totam aut blanditiis mollitia quas illo\\nut voluptatibus voluptatem\\nsimilique nostrum eum\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 29,\r\n    \"title\": \"iusto eius quod necessitatibus culpa ea\",\r\n    \"body\": \"odit magnam ut saepe sed non qui\\ntempora atque nihil\\naccusamus illum doloribus illo dolor\\neligendi repudiandae odit magni similique sed cum maiores\"\r\n  },\r\n  {\r\n    \"userId\": 3,\r\n    \"id\": 30,\r\n    \"title\": \"a quo magni similique perferendis\",\r\n    \"body\": \"alias dolor cumque\\nimpedit blanditiis non eveniet odio maxime\\nblanditiis amet eius quis tempora quia autem rem\\na provident perspiciatis quia\"\r\n  }\r\n]';
    var parsed = json.decode(szPosts) as List<dynamic>;

    // parse into List
    // var parsed = json.decode(response.body) as List<dynamic>;

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
