mixin Apis {

  static String baseAPI = 'https://api.nytimes.com/svc/topstories/v2/';

  static String newsAPI = 'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=Avje3ReMsrWI62lYgCAdr9Cggah9Yz5F';
  static String newsCategoryAPI = '.json?api-key=Avje3ReMsrWI62lYgCAdr9Cggah9Yz5F';

  static String bookListApi = 'https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=Avje3ReMsrWI62lYgCAdr9Cggah9Yz5F';

  static String bookApi =  "https://api.nytimes.com/svc/books/v3/lists/";
      //"2021-04-01/Paperback%20Nonfiction";

  //newsCat
      //".json?api-key=[YOUR_API_KEY]";

  static const String acToken = 'token';
}
