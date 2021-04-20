import 'package:flutter/material.dart';
import 'package:navigator_app/model/book.dart';

class BooksListPage extends Page {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListPage({
    this.books,
    this.onTapped,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return _BooksListScreen(
          books: books,
          onTapped: onTapped,
        );
      },
    );
  }
}

class _BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  _BooksListScreen({
    this.books,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () => onTapped(book),
          );
        },
      ),
    );
  }
}
