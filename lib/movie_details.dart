import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  var imageUrl = "";
  var overview = "";
  var title = "";
  MovieDetails({this.imageUrl, this.overview, this.title});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.imageUrl),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Over View : \n ${widget.overview}',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
