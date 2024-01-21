class UserModel{
  bool isGuide;
  String guideId;
  String username;
  String email;

  UserModel({
    required this.isGuide,
    required this.email,
    required this.username,
    String? guideId,
  }) : guideId = isGuide ? (guideId ?? "NotAGuide") : "NotAGuide";

  static String? get currentUsername {
    return _currentUser?.username;
  }

  static UserModel? _currentUser;

  static void setCurrentUser(UserModel user) {
    _currentUser = user;
  }
}

