import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list/app/core/widget/todo_list_field.dart';
import 'package:todo_list/app/core/widget/todo_list_logo.dart';
import 'package:todo_list/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultListenerNotifier(changeNotifier: context.read<LoginController>())
        .listener(
            context: context,
            successCallback: (notifier, listenerInstance) {
              print('login efetuado');
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TodoListLogo(),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TodoListField(
                                controller: _emailEC,
                                label: 'E-mail',
                                validator: Validatorless.multiple([
                                  Validatorless.required('Email é obrigatorio'),
                                  Validatorless.email('Email inválido')
                                ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TodoListField(
                                controller: _passwordEC,
                                label: 'Senha',
                                obscureText: true,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Senha obrigatoria'),
                                  Validatorless.min(6, 'No minimo 6 caracteres')
                                ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Esqueceu sua senha?')),
                                  ElevatedButton(
                                    onPressed: () {
                                      final formValid =
                                          _formKey.currentState?.validate() ??
                                              false;
                                      if (formValid) {
                                        final email = _emailEC.text;
                                        final password = _passwordEC.text;

                                        context
                                            .read<LoginController>()
                                            .login(email, password);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('Login'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ))),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF0F3F7),
                        border: Border(
                            top: BorderSide(
                                width: 2, color: Colors.grey.withAlpha(50)))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        SignInButton(
                          Buttons.Google,
                          padding: const EdgeInsets.all(5),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          text: 'Continue com o google',
                          onPressed: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não tem conta?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/register');
                                },
                                child: Text('Cadastra-se'))
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
