import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

// ИМПОРТ КНОПКИ ПЕРЕКЛЮЧЕНИЯ ТЕМЫ
import '../theme/theme_toggle_action.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Предзаполняем поля ФИО и Email
  final _nameController = TextEditingController(text: 'Оганнисян Нарек Геворгович');
  final _emailController = TextEditingController(text: 'ogannisyan@mail.ru');
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
          content: Text('Данные профиля успешно сохранены!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        actions: const [
          ThemeToggleAction(), // кнопка переключение темы
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Аватарка с иконкой фотоаппарата
                Center(
                  child: Stack(
                    children: [
                      // Круглая фотография (аватар)
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/1.png'),
                      ),
                      // Маленький кружочек с иконкой камеры поверх фото
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor, // Берет цвет фона (белый или темный)
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(Icons.camera_alt, size: 20, color: Theme.of(context).iconTheme.color), // Цвет иконки из темы
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                //Поле ФИО
                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: 'ФИО',
                  hintText: 'Введите ФИО',
                  prefixIcon: const Icon(Icons.person_outline),
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Email
                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: 'Email',
                  hintText: 'Введите Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Пароль
                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: 'Пароль',
                  hintText: 'Новый пароль',
                  prefixIcon: const Icon(Icons.shield_outlined),
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                //Поле Повторите пароль
                CustomTextFormField(
                  inputType: InputFieldType.confirmPassword,
                  labelText: 'Повторите пароль',
                  hintText: 'Подтвердите новый пароль',
                  prefixIcon: const Icon(Icons.shield_outlined),
                  controller: _confirmPasswordController,
                  passwordToCompare: _passwordController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),

                // Черная кнопка "Сохранить"
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Сохранить', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}