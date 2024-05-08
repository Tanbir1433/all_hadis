class Hadith {
  int? hadithId;
  int? bookId;
  String? bookName;
  int? chapterId;
  int? sectionId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;

  Hadith({this.hadithId, this.bookId, this.bookName, this.chapterId, this.sectionId, this.narrator,this.bn, this.ar,this.arDiacless,this.note,this.gradeId,this.grade,this.gradeColor});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (hadithId != null) {
      map['hadith_id'] = hadithId;
    }
    map['book_id'] = bookId;
    map['book_name'] = bookName;
    map['chapter_id'] = chapterId;
    map['section_id'] = sectionId;
    map['narrator'] = narrator;
    map['bn'] = bn;
    map['ar'] = ar;
    map['ar_diacless'] = arDiacless;
    map['note'] = note;
    map['grade_id'] = gradeId;
    map['grade'] = grade;
    map['grade_color'] = gradeColor;
    return map;
  }

  Hadith.fromMap(Map<String, dynamic> map) {
    hadithId = map['hadith_id'];
    bookId = map['book_id'];
    bookName = map['book_name'];
    chapterId = map['chapter_id'];
    sectionId = map['section_id'];
    narrator = map['narrator'];
    bn = map['bn'];
    ar = map['ar'];
    arDiacless = map['ar_diacless'];
    note = map['note'];
    gradeId = map['grade_id'];
    grade = map['grade'];
    gradeColor = map['grade_color'];
  }
}



