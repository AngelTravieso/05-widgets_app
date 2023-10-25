import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  // Se extiende de ConsumerWidget
  static const name = 'counter_screen';

  const CounterScreen({super.key});

// Widget ref guardar la referencia al provider que le indiquemos
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Vigila los cambios de ese counterProvider y redibuja de ser necesario
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            // icon: Icon(Icons.light_mode_rounded),
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update(
                    (isDarkMode) => !isDarkMode,
                  );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter', // valor inicial 5
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // * No usar watch en métodos

          // forma 1
          // read devuelve el valor actual del provider, aumentar el valor del contador
          ref.read(counterProvider.notifier).state++;

          // forma 2
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
