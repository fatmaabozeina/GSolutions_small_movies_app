import 'package:flutter/material.dart';
import 'package:flutterappmovieslist/movie_details.dart';
import 'package:flutterappmovieslist/data_request.dart';
import 'package:flutterappmovieslist/data_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MoviesListPage extends StatefulWidget {
  static const String id = 'moviesList';

  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  static const myUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=4e519b3530c2faf266e5112ee7d353e9&query=%22a&fbclid=IwAR2zoysQ6dI5DTj7VXKcIiPGNgoq9W4btf0_TFSlfz5RfA7nipabb-3U9CA";
  DataRequest network = DataRequest(myUrl);
  List<Result> results = [];
  @override
  void initState() {
    super.initState();
    network.requestData().then((value) {
      setState(() {
        results = value.results;
        print('nice');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                child: Image.network(
                    'https://www.themoviedb.org/t/p/w1280/${results[index].posterPath}'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        '${results[index].title}',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text('(${results[index].releaseDate.year})',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ),
                    TextButton(
                      child: Text('Load more'),
                      style: ButtonStyle(
                        // shadowColor: MaterialStateProperty.Colors.black,
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            return null; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieDetails(
                            imageUrl:
                                'https://www.themoviedb.org/t/p/w1280/${results[index].posterPath}',
                            overview: '${results[index].overview}',
                            title: '${results[index].title}',
                          );
                        }));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
