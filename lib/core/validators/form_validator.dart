import 'package:form_field_validator/form_field_validator.dart';

final validatedPhoneForm = MultiValidator([
  RequiredValidator(errorText: 'El teléfono es requerido'),
  MinLengthValidator(8, errorText: 'Prueba con esta estructura 00-00-00-00'),
]);
final validateUserLogin = MultiValidator([
  RequiredValidator(errorText: 'El usuario es requerido'),
]);

final validatedEmail = MultiValidator([
  RequiredValidator(errorText: 'El correo es requerido'),
  EmailValidator(errorText: 'Escriba un correo electrónico valido')
]);

final validatedPasswordLogin = MultiValidator([
  RequiredValidator(errorText: 'La contraseña es requerida'),
]);

final validatedPassword = MultiValidator([
  RequiredValidator(errorText: 'La contraseña es requerida'),
  MinLengthValidator(8,
      errorText: 'La contraseña debe tener como mínimo 8 caracteres'),
  PatternValidator(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$',
    errorText:
        'La contraseña debe contener letras mayúsculas, minúsculas, números y caracteres especiales',
  ),
]);
