import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:offline_first/app/commons/keys/storage_keys.dart';
import 'package:offline_first/app/features/auth/data/datasource/i_auth_datasource.dart';
import 'package:offline_first/app/features/auth/data/dtos/user_dto.dart';
import 'package:offline_first/core/exceptions/exception_indentifier.dart';
import 'package:offline_first/core/services/auth/i_auth_service.dart';
import 'package:offline_first/core/services/storage/i_storage_service.dart';

class AuthDatasource implements IAuthDatasource {
  final IAuthService auth;
  final IStorageService storage;
  const AuthDatasource({required this.auth, required this.storage});

  @override
  Future<void> createUserCredencial({required String email, required String password}) async {
    final result = await auth.signup(password: password, email: email);

    if (result.success == false) {
      throw ExceptionIdentifier.handlerErrorAuth(type: result.errorCode!);
    }
    try {
      await signin(email: email, password: password);
    } catch (e) {
      throw ExceptionIdentifier.handlerErrorAuth(type: result.errorCode!);
    }
  }

  @override
  Future<void> signin({required String email, required String password}) async {
    final result = await auth.signin(password: password, email: email);
    if (result.success == false) {
      throw ExceptionIdentifier.handlerErrorAuth(type: result.errorCode!);
    }

    try {
      final user = await auth.userIsLogged();
      final currentUser = user.data as User;
      await saveUserStorage(
          user: UserDto(
        userName: '',
        userEmail: currentUser.email ?? '',
        uid: currentUser.uid,
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signout() async {
    final result = await auth.signout();
    if (result.success == false) {
      throw ExceptionIdentifier.handlerErrorAuth(type: result.errorCode!);
    }
    try {
      await deleteUserStorage();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveUserStorage({required UserDto user}) async {
    try {
      await storage.write(key: StorageKeys.user, value: jsonEncode(user.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUserStorage() async {
    try {
      await storage.delete(key: StorageKeys.user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDto?> getUserStorage() async {
    try {
      final userJsonString = await storage.read(key: StorageKeys.user);

      if (userJsonString != null) {
        final userMap = jsonDecode(userJsonString);
        return UserDto.fromJson(json: userMap);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
