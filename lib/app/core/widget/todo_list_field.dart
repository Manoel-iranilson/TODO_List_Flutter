import 'package:flutter/material.dart';
import 'package:todo_list/app/core/ui/to_do_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? sufixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.sufixIconButton,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? sufixIconButton == null : true,
            'obscureText não pode ser enviado com sufixIconButton'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (_, obscureTextValue, child) {
          return TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                label: Text(label),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.red)),
                isDense: true,
                suffixIcon: sufixIconButton ??
                    (obscureText == true
                        ? IconButton(
                            onPressed: () {
                              obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(obscureTextVN.value
                                ? ToDoListIcons.eye
                                : ToDoListIcons.eye_slash),
                          )
                        : null)),
            obscureText: obscureTextValue,
          );
        });
  }
}
