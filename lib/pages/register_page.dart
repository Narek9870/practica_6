import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../routes.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для 4-х полей
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Регистрация прошла успешно!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                //Заголовок "Регистрация" строго по центру макета
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                //Поле ФИО (только буквы и пробелы)
                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: 'ФИО',
                  hintText: 'Иванов Иван Иванович',
                  prefixIcon: const Icon(Icons.person_outline),
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Email
                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: 'Email',
                  hintText: 'example@mail.ru',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Пароль
                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Не менее 6 символов (+, _, -)',
                  prefixIcon: const Icon(Icons.shield_outlined),
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Повторите пароль (сверяется с _passwordController)
                CustomTextFormField(
                  inputType: InputFieldType.confirmPassword,
                  labelText: 'Повторите пароль',
                  hintText: 'Повторите пароль',
                  prefixIcon: const Icon(Icons.shield_outlined),
                  controller: _confirmPasswordController,
                  passwordToCompare: _passwordController, // Проверка совпадения
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),

                //Черная кнопка "Зарегистрироваться"
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _submit,
                    child: const Text('Зарегистрироваться', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 30),

                //Ссылка снизу на вход
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Уже есть аккаунт? ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Войдите',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}