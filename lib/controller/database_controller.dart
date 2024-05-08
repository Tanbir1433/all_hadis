import 'package:all_hadis/model/hadith_model.dart';
import 'package:all_hadis/model/section_model.dart';
import 'package:get/get.dart';
import '../database/database_helper.dart';
import '../model/books_model.dart';
import '../model/chapter_model.dart';

class DatabaseController extends GetxController {
  var booksList = <Books>[].obs;
  var chapterList = <Chapter>[].obs;
  var hadithList = <Hadith>[].obs;
  var sectionsList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
    fetchChapter();
    fetchHadith();
    fetchSections();
  }

  void fetchBooks() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedBooks = await dbHelper.getBooksList();
      booksList.value = fetchedBooks;
    } finally {
      isLoading.value = false;
    }
  }

  void fetchChapter() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedChapter = await dbHelper.getChapterList();
      chapterList.value = fetchedChapter;
    } finally {
      isLoading.value = false;
    }
  }

  void fetchHadith() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedHadith = await dbHelper.getHadithList();
      hadithList.value = fetchedHadith;
    } finally {
      isLoading.value = false;
    }
  }

  void fetchSections() async {
    isLoading.value = true;
    try {
      var dbHelper = DatabaseHelper();
      var fetchedSections = await dbHelper.getSections();
      sectionsList.value = fetchedSections;
    } finally {
      isLoading.value = false;
    }
  }




}