import 'package:flutter/material.dart';
import 'package:newsapp/models/newsinfo.dart';
import 'package:newsapp/services/apimanager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('NEWS', style: GoogleFonts.lora(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
            future: _newsModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];
                    if (article.author != null &&
                        article.content != null &&
                        article.description != null &&
                        article.publishedAt != null &&
                        article.source != null &&
                        article.title != null &&
                        article.url != null &&
                        article.urlToImage != null) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        height: 250,
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.network(
                                article.urlToImage,
                                height: 250,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title,
                                    style: GoogleFonts.lora(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(article.description,
                                      style: GoogleFonts.lora(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.grey[200],
                      );
                    } else
                      return Center(
                          child: SizedBox(
                        height: 10,
                      ));
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
