class LeaderBoardModel {
  String? id;
  String? userImageUrl;
  String? firstName;
  String? lastName;
  num? score;

  LeaderBoardModel(
      {this.id, this.userImageUrl, this.firstName, this.lastName, this.score});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImageUrl = json['user_image_url'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_image_url'] = userImageUrl;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['score'] = score;
    return data;
  }
}
