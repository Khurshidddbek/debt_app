import 'package:flutter/material.dart';

class ContactsViewModel extends ChangeNotifier {
  bool isLoading = false;

  List<dynamic> contactsList = [
    {
      'name': 'Salim',
      'avatar': 'assets/images/user_avatars/avatar-1.png',
    },
    {
      'name': 'Qodir',
      'avatar': 'assets/images/user_avatars/avatar-2.png',
    },
    {
      'name': 'Zebo',
      'avatar': 'assets/images/user_avatars/avatar-3.png',
    },
    {
      'name': 'Abdullajon',
      'avatar': 'assets/images/user_avatars/avatar-4.png',
    },
    {
      'name': 'Qashqadaryo',
      'avatar': 'assets/images/user_avatars/avatar-5.png',
    },
    {
      'name': 'Qodirali',
      'avatar': 'assets/images/user_avatars/avatar-6.png',
    }
  ];
}
