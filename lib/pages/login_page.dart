import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Ключ формы для валидации
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для считывания текста
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Освобождаем память при закрытии экрана (dispose)
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Метод отправки формы
  void _submit() {
    // Запускаем валидацию всех полей
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus(); // Закрываем клавиатуру
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Вход выполнен успешно!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, Routes.home
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // SingleChildScrollView спасает от ошибки переполнения при открытии клавиатуры
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Текст заголовка строго по макету
                const Text(
                  'Добро пожаловать!\nВойдите в свой аккаунт\nИли создайте новый',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 40),

                //Поле Email (используем наш CustomTextFormField)
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
                  hintText: 'Введите пароль',
                  prefixIcon: const Icon(Icons.shield_outlined),
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 8),

                //Ссылка "Забыли пароль?" по правому краю
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Забыли пароль?',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                //Черная кнопка "Войти" по макету
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
                    child: const Text('Войти', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 40),

                //Текст снизу со ссылкой на регистрацию
                Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.register); // пускаем на регистрацию
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Нет аккаунта? ',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Зарегистрируйтесь',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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