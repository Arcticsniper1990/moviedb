import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
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
                  Image(image: AssetImage('images/image.png'),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Название фильма', overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Дата выхода', overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),),
                          SizedBox(height: 20,),
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                'Описание фильма в две строки должно быть и оканчиваться троеточием должно оно ffffffff f   ffffffffffffffffffff',
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
        });
  }

}

