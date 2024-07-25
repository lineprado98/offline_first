import 'package:offline_first/app/features/auth/domain/entities/user_entity.dart';
import 'package:offline_first/core/exceptions/custom_exception.dart';
import 'package:result_dart/result_dart.dart';

abstract class IAuthRepository {
  AsyncResult<Unit, CustomException> createUserCredencial({
    required String email,
    required String password,
  });
  AsyncResult<Unit, CustomException> signin({
    required String email,
    required String password,
  });
  AsyncResult<Unit, CustomException> signout();
  AsyncResult<UserEntity, CustomException> getUserStorage();
}
