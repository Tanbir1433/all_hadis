class Chapter{
  int? id;
  int? chapterId;
  int? bookId;
  String? title;
  int? number;
  String? hadisRange;
  String? bookName;

  Chapter({this.id, this.chapterId, this.bookId, this.title, this.number, this.hadisRange, this.bookName});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['chapter_id'] = chapterId;
    map['book_id'] = bookId;
    map['title'] = title;
    map['number'] = number;
    map['hadis_range'] = hadisRange;
    map['book_name'] = bookName;
    return map;
  }

  Chapter.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    chapterId = map['chapter_id'];
    bookId = map['book_id'];
    title = map['title'];
    number = map['number'];
    hadisRange = map['hadis_range'];
    bookName = map['book_name'];
  }

}