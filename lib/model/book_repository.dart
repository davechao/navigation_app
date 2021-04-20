import 'package:navigator_app/model/book.dart';

class BookRepository {

  List<Book> fetchBooks() {
    return _books;
  }

  List<Book> _books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];
}
