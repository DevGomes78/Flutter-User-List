import 'package:flutter/material.dart';
import 'package:flutter_users/controller/user_controller.dart';

import '../data/models/user_models.dart';

class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Users>>(
        future: UserController().getUser(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].image.toString()),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            snapshot.data![index].firstName.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            snapshot.data![index].lastName.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Buscar Usuario'),
    );
  }
}
