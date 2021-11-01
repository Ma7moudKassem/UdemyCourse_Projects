class PostModel {
  String uId;
  String name;
  String image;
  String text;
  String dateTime;
  String postImage;

  PostModel({
    this.uId,
    this.name,
    this.image,
    this.text,
    this.dateTime,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    text = json['text'];
    dateTime = json['dateTime'];
    postImage = json['postImage'];

  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'image' : image,
      'text' : text,
      'dateTime' : dateTime,
      'postImage' : postImage,

    };
  }
}
