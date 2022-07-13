import 'package:flutter/material.dart';
import 'package:flutter_users/views/user_list_page.dart';

import '../controller/search_user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: UserListPage(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Users'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchUser());
          },
          icon: const Icon(Icons.search),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
        ),
      ),
    );
  }
}
