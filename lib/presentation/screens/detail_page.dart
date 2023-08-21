import 'package:flutter/material.dart';
import 'package:flutter_application_news/data/models/news_model.dart';

import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Result arguments =
        ModalRoute.of(context)!.settings.arguments as Result;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //left
              children: [
                Text(
                  arguments.title,
                  style: GoogleFonts.acme(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: arguments.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      width: double.infinity,
                      height: 250,
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(arguments.imageUrl.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Descripcion: ",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(arguments.description),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "More Information: ",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.gps_fixed_rounded,
                          size: 20,
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("Country: ${arguments.country[0]}"),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.black38,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Creator: "),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 27),
                                child: Text(
                                  arguments.creator[0],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.category_sharp,
                          color: Colors.black38,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("Category: ${arguments.category[0]}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: Colors.black38,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        const Icon(Icons.info_outline_rounded),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "More information",
                                          style: GoogleFonts.epilogue(),
                                        ),
                                      ],
                                    ),
                                    content: Wrap(children: [
                                      Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FadeInImage(
                                            width: 250,
                                            height: 200,
                                            placeholder: const AssetImage(
                                                'assets/loading.gif'),
                                            image: NetworkImage(
                                                arguments.imageUrl.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.link_rounded,
                                        size: 15,
                                      ),
                                      Text(
                                        "Link: ",
                                        style: GoogleFonts.aleo(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        arguments.link,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const Icon(
                                        Icons.book,
                                        size: 15,
                                      ),
                                      Text(
                                        "Lenguage: ",
                                        style: GoogleFonts.aleo(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        arguments.language.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ]),
                                    actions: [
                                      Center(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cerrar",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "More information",
                            style: GoogleFonts.acme(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("Country: ${arguments.country[0]}"),
                //     Text("Creator: ${arguments.creator[0]}"),
                //     Text("Category: ${arguments.category[0]}"),
                //     const SizedBox(
                //       height: 20,
                //     ),
                //     Text("Link: ${arguments.link}"),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Abriendo Comentarios");
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Comentario:",
                          style: GoogleFonts.aleo(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Ingresa Comentario',
                            filled: true,
                            fillColor: Colors.black26,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
