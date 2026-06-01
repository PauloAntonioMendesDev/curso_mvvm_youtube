import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/utils/command.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';

class LoginViewmodel {
  final AuthRepository _authRepository;

  LoginViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  late final login = Command1(_login);

  Future<Result<void>> _login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );

    return result;
  }
}
