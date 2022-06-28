import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/generated/assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().user!;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              const SizedBox(height: 240 + 75),
              Image.asset(
                Assets.imagesHeader,
                height: 240,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              const Positioned(
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage(Assets.imagesUser2))),
            ],
          ),
          const SizedBox(height: 30),
          Text("${user.firstName} ${user.lastName}"),
          const SizedBox(height: 10),
          Text(user.email),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  CircleAvatar(
                      radius: 24,
                      backgroundColor: buttonBackground,
                      child: Icon(
                        Icons.edit,
                        size: 24,
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  Text('تعديل بياناتى'),
                ],
              ),
              Column(
                children: const [
                  CircleAvatar(
                      radius: 24,
                      backgroundColor: buttonBackground,
                      child: Icon(
                        Icons.star,
                        size: 24,
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  Text('المفضلة'),
                ],
              ),
              Column(
                children: const [
                  CircleAvatar(
                      radius: 24,
                      backgroundColor: buttonBackground,
                      child: Icon(
                        Icons.settings,
                        size: 24,
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  Text('الإعدادات'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
