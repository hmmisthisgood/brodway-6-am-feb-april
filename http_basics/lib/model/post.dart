class Post {
  int userId;
  int id;
  String body;
  String title;

  Post({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
  });

  
  static Post newPost = new Post(userId: 1, id: 2, body: "", title: "");

  factory Post.convertFromJson(Map json) {
    return Post(
      userId: json['userId'] ?? -1,
      id: json['id'] ?? -1,
      body: json['body'] ?? "",
      title: json['title'] ?? "",
    );
  }

  static List<Post> fromList(List data) {
    // List<Post> postsList = [];

    // for (int i = 0; i < data.length; i++) {
    //   final map = data[i];

    //   final Post post = Post.convertFromJson(map);

    //   postsList.add(post);
    // }

    return data
        .map<Post>((listItem) => Post.convertFromJson(listItem))
        .toList();

    // return postsList;
  }

  Map convertFromPostToMap() {
    return {"userId": userId, "id": id, "body": body, "title": title};
  }
}
