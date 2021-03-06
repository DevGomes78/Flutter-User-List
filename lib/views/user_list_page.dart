import 'package:flutter/material.dart';
import 'package:flutter_users/controller/user_controller.dart';
import 'package:flutter_users/views/details_page.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late final UserController controller;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    controller = context.read<UserController>();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    UserController provider = Provider.of<UserController>(context);
    return Scaffold(
        body: provider.users.isNotEmpty
            ? ListView.builder(
          itemCount: provider.users.length,
            itemBuilder: (context, index) {
                var lista = provider.users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>DetailsPage(user: provider.users[index])));
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(lista['image']),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              lista['firstName'],
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              lista['lastName'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
