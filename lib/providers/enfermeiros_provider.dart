import 'package:flutter/material.dart';
import 'package:infoclin_913/apis/enfermeiros_api.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';

class EnfermeirosProvider extends ChangeNotifier {
  List<Enfermeiros1> enfermeiros = [];
  bool isLoading = false;
  String? error;

  Future<void> loadEnfermeiros() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      enfermeiros = await EnfermeirosApi().findAll();
    } catch (e) {
      error = "Ocorreu um erro ao carregar os enfermeiros.";
    }

    isLoading = false;
    notifyListeners();
  }
}