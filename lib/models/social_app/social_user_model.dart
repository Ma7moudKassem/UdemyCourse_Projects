class SocialUserModel {
  String uId;
  String name;
  String email;
  String phone;
  String image;
  String cover;
  String bio;
  bool isEmailVerified;

  SocialUserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
      'name': name,
      'phone': phone,
      'image' : image,
      'cover': cover,
      'bio':bio,
      'isEmailVerified': isEmailVerified,

    };
  }
}
