import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e, s) {
      dev.log('$s');
      dev.log('$e');
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      dev.log('$s');
      dev.log('$e');
      AuthException(message: e.message ?? 'Erro ao realizar o login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);
      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(
            message:
                'Cadastro realizado com o google,não pode ser resetado a senha');
      } else {
        throw AuthException(message: 'Email não cadastrado ');
      }
    } on PlatformException catch (e, s) {
      dev.log('$e');
      dev.log('$s');
      throw AuthException(message: 'Erro ao resetar a senha');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final loginMehods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);
        if (loginMehods.contains('password')) {
          throw AuthException(
              message:
                  'Voce utilizou o e-mail para cadastro no TodoList, caso tenha esquecido a senha , por favor clique no esqueci sua senha');
        } else {
          final googleAuth = await googleUser.authentication;
          final fireabseCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          var userCredential =
              await _firebaseAuth.signInWithCredential(fireabseCredential);
          return userCredential.user;
        }
      }
    } on PlatformException catch (e, s) {
      dev.log('$e');
      dev.log('$s');
      throw AuthException(message: e.message ?? '');
    } on FirebaseAuthException catch (e, s) {
      dev.log('$e');
      dev.log('$s');
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(
            message:
                ''''Login inválido você se registrou no TodoList com os seguintes probedores:
                ${loginMethods?.join(',')}
        ''');
      } else {
        throw AuthException(message: 'Erro ao realizar login');
      }
    }
  }
  
  @override
  Future<User?> googleLogout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }
}
