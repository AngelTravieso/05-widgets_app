import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider = proveedor de estado de nuestra aplicación
final counterProvider = StateProvider<int>((ref) => 5); // valor inicial