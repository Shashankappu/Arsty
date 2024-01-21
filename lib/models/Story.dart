class Story{
  String? username;
  String placename;
  String storyContent;

  Story({String? username, required this.placename, required this.storyContent})
      : username = username ?? "anonymous";

}
