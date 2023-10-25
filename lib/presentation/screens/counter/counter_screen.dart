import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  // Se extiende de ConsumerWidget
  static const name = 'counter_screen';

  const CounterScreen({super.key});

// Widget ref guardar la referencia al provider que le indiquemos
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Vigila los cambios de ese counterProvider y redibuja de ser necesario
    final int clickCounter = ref.watch(
      counterProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter', // valor inicial 5
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
