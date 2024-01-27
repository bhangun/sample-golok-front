import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/rest/rest_services.dart';
import '../models/user.dart';
import '../services/user_services.dart';

part 'user_bloc.g.dart';

final userBloc = ChangeNotifierProvider<UserBloc>((ref) => UserBloc());

/* final userProvider = FutureProvider<List<User>>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/users.json'),
  );
  return User.listFromJson(content);
}); */

/* final userProvider = FutureProvider<List<User>>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/users.json'),
  );
  return User.listFromJson(content);
}); */


@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<List<User>> build() async {
    final content = json.decode(
      await rootBundle.loadString('assets/data/users.json'),
    );

    return [...User.listFromJson(content)];
  }

  //Future<void> addTodo(User user) async {}

  void add(User user) {
    state = <User>[
      ...state,
      User(id: 123),
    ] as AsyncValue<List<User>>;
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

class UserBloc extends ChangeNotifier {
  Future<User> getUser(String id) async {
    var response = await RestServices.fetch('/api/user/$id');
    return User.fromJson(json.decode(response));
  }

  itemTap(int position) {
    /* try {
      position = position;
      user = userList![position];
      isItemEmpty = false;
  
    } catch (e) {
      isItemEmpty = true;
    } */
  }

  add() {}

  save() {
    /*  try {
      isUpdated
          ? UserServices.updateUser(_toUser())
          : UserServices.createUser(_toUser());
  
 
      getUserList();
    } catch (e) {
      // print(e.toString());
    } */
  }

  delete(int id) {
    try {
      UserServices.deleteUser(id);

      getUserList();
    } catch (e) {
      // print(e.toString());
    }
  }

  setUser(User user) {}

  update() {
    /* try {
    
      isUpdated = true;

      getUserList();
    } catch (e) {
     // print(e.toString());
    } */
  }

  getUserList() async {
    // UserServices.users().then((data) => _setUserList(data));
  }

  /* FutureProvider<List<User>> users(){
    return FutureProvider<List<User>>((ref) async {
      return await UserServices.users();
    });
  } */

  usersList() async {
    return await UserServices.users();
  }

  /* users() {
    return FutureProvider<List<User>>((ref) async {
      final content = json.decode(
        await rootBundle.loadString('assets/data/users.json'),
      ) as List<User>;
      return User.listFromJson(content);
    }) as AsyncValue<List<User>>;
  } */

  /*  _setUserList(List<User> data) {
    if (data.isNotEmpty) {
      userList = data;
      totalItem = data.length;
    }
  } */

  /* User _toUser() {
    return User(
      id: isUpdated ? user!.id : 0,
      /*   username: username, 
    firstName: firstName, 
    lastName: lastName, 
    email: email, 
    password: password, 
    phone: phone, 
    userStatus: userStatus, */
    );
  } */

  viewList() {
    getUserList();
  }
}
