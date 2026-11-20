import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // Этот файл сгенерируется

final getIt = GetIt.instance;

/// Регистрируем все зависимости
@InjectableInit()
void setupDI() => getIt.init();