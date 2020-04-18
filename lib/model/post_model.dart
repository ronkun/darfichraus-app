import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<String> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return jsonData;
  // return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  String id;

  Post({
    this.id
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    id: json["id"]
  );

  Map<String, dynamic> toJson() => {
    "id": id
  };
}