import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/core/notifier/default_listener_notifier.dart';

import 'package:todo_list/app/core/ui/theme_extensions.dart';
import 'package:todo_list/app/core/validators/validator.dart';
import 'package:todo_list/app/core/widget/todo_list_field.dart';
import 'package:todo_list/app/core/widget/todo_list_logo.dart';
import 'package:todo_list/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final defaultListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());
    defaultListener.listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ClipOval(
              child: Container(
                color: context.primaryColor.withAlpha(50),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    size: 20, color: context.primaryColor),
              ),
            )),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('TODO List',
              style: TextStyle(color: context.primaryColor, fontSize: 10)),
          Text('Cadastro',
              style: TextStyle(color: context.primaryColor, fontSize: 15))
        ]),
      ),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.width * .5,
          child: FittedBox(child: TodoListLogo(), fit: BoxFit.fitHeight),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TodoListField(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email é obrigatorio'),
                      Validatorless.email('Email inválido')
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TodoListField(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatoria'),
                      Validatorless.min(6, 'No minimo 6 caracteres')
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TodoListField(
                    label: 'Confirmar senha',
                    obscureText: true,
                    controller: _confirmPasswordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('confirma senha obrigatoria'),
                      Validators.compare(_passwordEC, "Senhas não são iguais")
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          context
                              .read<RegisterController>()
                              .registerUser(_emailEC.text, _passwordEC.text);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        )
      ]),
    );
  }
}
