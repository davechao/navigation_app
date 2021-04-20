import 'package:flutter/material.dart';
import 'package:navigator_app/model/book.dart';

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({
    this.book,
  }) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return _BookDetailsScreen(book: book);
      },
    );
  }
}

class _BookDetailsScreen extends StatelessWidget {
  final Book book;

  _BookDetailsScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
