class Section {
  int? id;
  int? bookId;
  int? bookName;
  int? chapterId;
  int? sectionId;
  String? title;
  String? preface;
  int? number;

  Section({
    this.id,
    this.bookId,
    this.bookName,
    this.chapterId,
    this.sectionId,
    this.title,
    this.preface,
    this.number,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['book_id'] = bookId;
    map['book_name'] = bookName;
    map['chapter_id'] = chapterId;
    map['section_id'] = sectionId;
    map['title'] = title;
    map['preface'] = preface;
    map['number'] = number;
    return map;
  }

  Section.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    bookId = map['book_id'];
    bookName = map['book_name'];
    chapterId = map['chapter_id'];
    sectionId = map['section_id'];
    title = map['title'];
    preface = map['preface'];
    number = map['number'];
  }
}
