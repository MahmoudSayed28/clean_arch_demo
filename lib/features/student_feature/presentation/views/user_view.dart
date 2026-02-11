import 'package:demo/features/student_feature/presentation/widgets/user_view_body.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body:const UserViewBody()
    );
  }
}