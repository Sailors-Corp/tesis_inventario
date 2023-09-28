import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/core/validators/form_validator.dart';
import 'package:inventory_tesis/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oktoast/oktoast.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late bool obscureText = true;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  void _clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _keyForm.currentState?.reset();
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoadingAuthState) {
            const CircularProgressIndicator.adaptive();
          } else if (state is FailureAuthState) {
            context.router.pop();
            showToast(
              state.error,
              duration: const Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: Colors.red,
            );
          } else {
            _clearForm();
            context.router.replace(const HomeRoute());
          }
        },
        child: AuthForm(
            keyForm: _keyForm,
            emailController: _emailController,
            passwordController: _passwordController,
            authBloc: authBloc),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required GlobalKey<FormState> keyForm,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.authBloc,
  })  : _keyForm = keyForm,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _keyForm;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    validator: validateUserLogin,
                    controller: _emailController,
                    cursorColor: AppColors.primaryBlue,
                    decoration: const InputDecoration(
                      hintText: "Usuario",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    validator: validatedPasswordLogin,
                    controller: _passwordController,
                    cursorColor: AppColors.primaryBlue,
                    decoration: const InputDecoration(
                      hintText: "***********",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.lock_outlined,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          authBloc.add(
                            OnLoginEvent(
                              _emailController.text,
                              _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (state is LoadingAuthState)
                              ? const CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                )
                              : const SizedBox(width: 0),
                          const SizedBox(width: 10),
                          const Text('Iniciar sesión'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
