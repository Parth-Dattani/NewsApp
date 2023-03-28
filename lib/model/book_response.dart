class BookResponse {
  String? status;
  String? copyright;
  int? numResults;
  List<BookResults>? results;

  BookResponse({this.status, this.copyright, this.numResults, this.results});

  BookResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results = <BookResults>[];
      json['results'].forEach((v) {
        results!.add(BookResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['copyright'] = copyright;
    data['num_results'] = numResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookResults {
  String? listName;
  String? displayName;
  String? listNameEncoded;
  String? oldestPublishedDate;
  String? newestPublishedDate;
  String? updated;

  BookResults(
      {this.listName,
        this.displayName,
        this.listNameEncoded,
        this.oldestPublishedDate,
        this.newestPublishedDate,
        this.updated});

  BookResults.fromJson(Map<String, dynamic> json) {
    listName = json['list_name'];
    displayName = json['display_name'];
    listNameEncoded = json['list_name_encoded'];
    oldestPublishedDate = json['oldest_published_date'];
    newestPublishedDate = json['newest_published_date'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['list_name'] = listName;
    data['display_name'] = displayName;
    data['list_name_encoded'] = listNameEncoded;
    data['oldest_published_date'] = oldestPublishedDate;
    data['newest_published_date'] = newestPublishedDate;
    data['updated'] = updated;
    return data;
  }
}
