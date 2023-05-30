import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

//Case 1: when user press signIn button, state will be changed to isLoading first then changed to isAuthenticated.
//Case 2: when user press signOut button, state will be changed to isLoading first then changed to isUnAuthenticated.

class isLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//when user is authenticated, state will be changed to isAuthenticated
class isAuthenticated extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//If any error occurs, state will be changed to isError
class isError extends LoginState {
  final String error;

  isError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

//This is the initial state of BloC. If user is not authenticated, state will be changed to isUnAuthenticated
class isUnAuthenticated extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
