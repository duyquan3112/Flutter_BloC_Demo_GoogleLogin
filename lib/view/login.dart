import 'package:demo_bloc_gmaillogin/bloc/login_bloc.dart';
import 'package:demo_bloc_gmaillogin/bloc/login_event.dart';
import 'package:demo_bloc_gmaillogin/bloc/login_state.dart';
import 'package:demo_bloc_gmaillogin/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _loginWithGoogle(context) {
    BlocProvider.of<LoginBloc>(context).add(GoogleSignInEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is isAuthenticated) {
            //navigating to dashboard
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DashBoardPage()));
          }
          if (state is isError) {
            //show SnackBar send error message
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is isUnAuthenticated) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    _loginWithGoogle(context);
                  },
                  child: Text('Sign In with Google'),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
