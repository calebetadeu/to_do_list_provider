import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list_provider/app/exception/auth_exception.dart';
import 'package:to_do_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

 final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      dev.log('$s');
      dev.log('$e');
      if (e.code == 'email-already-in-user') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'Email já utilizado,por favor escolha outro email');
        } else {
          throw AuthException(
              message:
                  'Voce se cadastrou na todoList pelo Google,por favor utilize ele');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário ');
      }
    }
  }
}
