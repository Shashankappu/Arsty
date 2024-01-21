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
}