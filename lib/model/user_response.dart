class UserResponse{
  String? email;
  String? uid;
  String? country;
  String? topic;

  UserResponse({
    this.email,
    this.uid,
    this.country,
    this.topic
  });


  UserResponse.fromMap(Map<String, dynamic> json) {
    email = json['email'];
    uid = json['uid'];
    country = json['country'];
    topic = json['topic'];
  }

  Map<String, dynamic> toMap(){
    return{
      'email': email,
      'uid': uid,
      'country': country,
      'topic': topic,
    };
  }

}

