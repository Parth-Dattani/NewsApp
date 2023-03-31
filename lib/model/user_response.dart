class UserResponse{
  String? email;
  String? uid;
  String? country;
  String? topic;
  String? profile;
  String? userName;
  String? fullName;
  String? phone;
  String? bio;
  String? website;

  UserResponse({
    this.email,
    this.uid,
    this.country,
    this.topic,
    this.profile,
    this.userName,
    this.fullName,
    this.phone,
    this.bio,
    this.website,
  });


  UserResponse.fromMap(Map<String, dynamic> json) {
    email = json['email'];
    uid = json['uid'];
    country = json['country'];
    topic = json['topic'];
    profile = json['profile'];
    userName = json['userName'];
    fullName = json['fullName'];
    phone = json['phone'];
    bio = json['bio'];
    website = json['website'];
  }

  Map<String, dynamic> toMap(){
    return{
      'email': email,
      'uid': uid,
      'country': country,
      'topic': topic,
      'profile': profile,
      'userName': userName,
      'fullName': fullName,
      'phone': phone,
      'bio': bio,
      'website': website,
    };
  }

}

