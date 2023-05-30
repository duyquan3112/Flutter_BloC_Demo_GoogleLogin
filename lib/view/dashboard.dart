import 'package:demo_bloc_gmaillogin/bloc/login_bloc.dart';
import 'package:demo_bloc_gmaillogin/bloc/login_event.dart';
import 'package:demo_bloc_gmaillogin/bloc/login_state.dart';
import 'package:demo_bloc_gmaillogin/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is isUnAuthenticated) {
            //navigating to LoginPage when user logged out
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          }
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: \n ${user.email}',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            user.photoURL != null ? Image.network(user.photoURL!) : SizedBox(),
            SizedBox(
              height: 20,
            ),
            user.displayName != null ? Text('${user.displayName}') : SizedBox(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(SignOutEvent());
                },
                child: Text('Sign Out'))
          ],
        )),
      ),
    );
  }
}
