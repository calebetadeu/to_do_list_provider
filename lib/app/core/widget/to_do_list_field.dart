import 'package:flutter/material.dart';
import 'package:to_do_list_provider/app/core/ui/todo_list_icons.dart';

class ToDoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool isObscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  ToDoListField(
      {super.key,
      required this.label,
      this.isObscureText = false,
      this.suffixIconButton,
      this.controller,
      this.validator})
      : assert(isObscureText == true ? suffixIconButton == null : true,
            'Obscure Text não pode ser enviado em conjunto com o suffixIconButton'),
        obscureTextVN = ValueNotifier(isObscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, isObscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon: suffixIconButton ??
                (isObscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !isObscureTextValue;
                        },
                        icon: Icon(!isObscureTextValue
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )
                    : null),
          ),
          obscureText: isObscureTextValue,
        );
      },
    );
  }
}
