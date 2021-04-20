import 'package:flutter/material.dart';
import 'package:navigator_app/model/book.dart';
import 'package:navigator_app/model/book_repository.dart';
import 'package:navigator_app/page/book_details_page.dart';
import 'package:navigator_app/page/books_list_page.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book _selectedBook;

  BookRepository repository = BookRepository();

  @override
  Widget build(BuildContext context) {
    final books = repository.fetchBooks();

    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          BooksListPage(
            books: books,
            onTapped: _handleBookTapped,
          ),
          if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}
