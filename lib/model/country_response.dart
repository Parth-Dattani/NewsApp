class CountryResponse{
  String? code;
  String? name;

  CountryResponse({
    this.code,
    this.name
  });


  CountryResponse.fromMap(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toMap(){
    return{
      'code': code,
      'name': name,
    };
  }

}

