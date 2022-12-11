import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task01/models/post.dart';
import 'package:task01/services/remoteServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
//API
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

// UI
  @override
  List<Post>? posts;
  var isLoaded = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].body ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
