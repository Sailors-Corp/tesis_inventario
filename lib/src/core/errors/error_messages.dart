import 'package:flutter/widgets.dart';

abstract final class ErrorMessages {
  static const String invalidCredentials = 'invalid-credentials';
  static const String connectionError = 'connection-error';

  static String getMessage(BuildContext context, String error) {
    final map = {
      ErrorMessages.invalidCredentials: 'Credenciales inválidas',
      ErrorMessages.connectionError: 'Error de conexión',
    };

    return map[error] ?? 'Error inesperado';
  }
}
