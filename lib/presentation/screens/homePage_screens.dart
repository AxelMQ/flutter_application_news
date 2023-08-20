// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_news/presentation/providers/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: news.newsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Divider(),
                );
              },
              itemCount: news.newsList.length,
              itemBuilder: (context, index) {
                final res = news.newsList[index];
                return Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.newspaper,
                                    color: Colors.black26,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    res.country[0],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              res.title,
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.category,
                                  color: Colors.black26,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  res.category[0],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.black26,
                                  size: 18,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                Text(
                                  res.pubDate.toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          width: 200,
                          height: 110,
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: NetworkImage(res.imageUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
