import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';

import '../profile/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder<Response<dynamic>>(
        future: ref.read(apiProvider).get('users'),
        builder: (context, snapshot) {
          final response = snapshot.data;

          if (response == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<User> users = (response.data as List)
            .map((i) => User.fromJson(i))
            .toList();
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              final user = users[index];

              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProfileScreen(userTag: user.userTag),
                  ));
                },
                title: Text(user.name),
                subtitle: Text(user.userTag),
              );
            },
          );
        },
      )
    );
  }
}
