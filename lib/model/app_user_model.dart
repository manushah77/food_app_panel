class AppUserModel {
  String? userName;
  String? userImage;
  String? userId;
  String? userEmail;

  AppUserModel({
    this.userEmail,
    this.userName,
    this.userImage,
    this.userId,
  });

  AppUserModel.fromMap(Map<String, dynamic> map) {
    userImage = map['userImage'];
    userName = map['userName'];
    userId = map['userId'];
    userEmail = map['userEmail'];
  }
}
