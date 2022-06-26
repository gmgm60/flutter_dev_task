import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        children: [
            Row(children: [
               Expanded(child: Center(child: Text('إنشاء حساب',style: Theme.of(context).textTheme.headline5,))),
              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward)),

            ]),
        ],
      ),
          )),
    ));
  }
}
