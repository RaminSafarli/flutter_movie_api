import 'package:flutter/material.dart';
import 'package:flutter_movie_api/model/Movie.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = Uri.parse(
      "https://api.themoviedb.org/4/list/1?api_key=d66f058896bde58c77d8b9324f15b20c");
  int? counter;
  dynamic uiResult;
  bool isOpened = false;

  Future callMovie() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = movieFromJson(response.body);
        setState(() {
          counter = result.results.length;
          uiResult = result.results;
        });
      } else {
        debugPrint("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    callMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body:
          //  !isOpened
          //     ? Center(
          //         child: ElevatedButton(
          //           child: const Text("Get Data"),
          //           onPressed: () => setState(() {
          //             isOpened = true;
          //           }),
          //         ),
          //       ) :
          ListView.builder(
              itemCount: counter,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${uiResult[index].title}"),
                  subtitle: Text("${uiResult[index].overview}"),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                );
              }),
    );
  }
}
