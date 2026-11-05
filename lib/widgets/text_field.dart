import 'package:flutter/material.dart';

// Список типов полей ввода
enum InputFieldType { name, email, password, confirmPassword }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final TextEditingController? passwordToCompare; // Для проверки совпадения паролей
  final TextInputAction textInputAction; // Кнопка на клавиатуре (next / done)

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.passwordToCompare,
    this.textInputAction = TextInputAction.next, // По умолчанию переходит дальше
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  // Для скрытия/показа пароля (глазик)
  bool _hidePassword = true;

  // Функция проверки введенных данных (Валидация)
  String? _validator(String? value) {
    // 1. Поле не может быть пустым
    if (value == null || value.trim().isEmpty) {
      return "Поле не может быть пустым";
    }

    switch (widget.inputType) {
    // 2. Имя: только буквы и пробелы
      case InputFieldType.name:
        final reg = RegExp(r'^[A-Za-zА-Яа-я\s]+$');
        if (!reg.hasMatch(value)) {
          return "Имя должно содержать только буквы и пробелы";
        }
        return null;

    //формат со знаком @, текстом до/после и точкой
      case InputFieldType.email:
        final reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!reg.hasMatch(value)) {
          return "Введите корректный email (например, test@mail.ru)";
        }
        return null;

    //не менее 6 символов, буквы, цифры и символы
      case InputFieldType.password:
        if (value.length < 6) {
          return "Пароль должен быть не менее 6 символов";
        }
        // Проверяем наличие буквы, цифры и спецсимвола
        final reg = RegExp(r'^(?=.*[A-Za-zА-Яа-я])(?=.*\d)(?=.*[+_\\-]).+$');
        if (!reg.hasMatch(value)) {
          return "Пароль должен содержать буквы, цифры и символы (+, _, -)";
        }
        return null;

    //Подтверждение пароля: должен совпадать с полем пароля
      case InputFieldType.confirmPassword:
        if (widget.passwordToCompare != null && value != widget.passwordToCompare!.text) {
          return "Пароли не совпадают";
        }
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Проверяем, является ли поле паролем (чтобы скрыть текст звездочками)
    final isPasswordField = widget.inputType == InputFieldType.password ||
        widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordField && _hidePassword,
      textInputAction: widget.textInputAction,
      // Автоматический переход к следующему полю
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        // Иконка глазика справа только для паролей
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() => _hidePassword = !_hidePassword);
          },
        )
            : null,
        // Оформление границ строго (скругление 10.0)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF424F7B), width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: _validator,
    );
  }
}