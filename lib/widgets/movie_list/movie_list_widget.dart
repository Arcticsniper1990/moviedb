

import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}


class MovieListWidget extends StatefulWidget {
  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(imageName: 'images/image.png', title: 'Смертельная битва', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Смертельная `1`', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Смертельная 2', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Смертельная 3', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Смертельная 4', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Смертельная 5', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
    Movie(imageName: 'images/image.png', title: 'Дюна', time: 'April 7, 2021', description: 'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff'),
  ];
    var _filteredMovies = <Movie>[];
    final _searchController = TextEditingController();

    void _searchMovies() {
        if(_searchController.text.isNotEmpty) {
          print(_filteredMovies);
          _filteredMovies = _movies.where((Movie movie) {
            return movie.title.toLowerCase().contains(_searchController.text.toLowerCase());
          }).toList();
        } else {
          _filteredMovies = _movies;
        }
        setState(() {
        });

    }
    @override
    void initState() {
      super.initState();
      _filteredMovies = _movies;
        _searchController.addListener(_searchMovies);

    }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),


                child: Stack(
                  children: [Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black.withOpacity(0.2),),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        )
                        ]

                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(children: [
                      Image(image: AssetImage(movie.imageName),),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                movie.title, overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text(movie.time, overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),),
                              SizedBox(height: 20,),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: Text(
                                    movie.description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 10),)),


                            ],),
                        ),
                      ),

                    ],),
                  ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () { print('tap');},
                      ),
                    )
],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
                filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),

            ),
          ),
        ),
      ],
    );

  }
}

