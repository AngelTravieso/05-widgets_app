// Estado => isDarkModeProvider = boolean
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider(
    (ref) => colorList); // Provider es para mantener valores inmutables

// Un simple boolean
final isDarkModeProvider = StateProvider<bool>(
    (ref) => false); // StateProvider mantener alguna pieza de estado

// Un simpe int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider permite manejar estados complejos
// Un objeto de tipo AppTheme (custom)
// <Clase que controla estado, Tipo de la clase personalizada>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
); // Cuando el state es un poco más complicado

// Hay gente que le pone Controller o Notifier
// El ThemeNotifier controla nuestro estado, debe extender de StateNotifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier()
      : super(
            AppTheme()); // Crea una instancia de AppTheme (con todo lo que tenga ella)

  // Esto me permite ver todo lo que exista (propiedades) de la clase (AppTheme)

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {}
}
