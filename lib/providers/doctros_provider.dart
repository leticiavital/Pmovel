import 'package:flutter/material.dart';
import 'package:infoclin_913/apis/doctors_api.dart';
import 'package:infoclin_913/Domain/doctors.dart';

class DoctorsProvider extends ChangeNotifier { // --> gerencia o estado e manda notificações
  List<Doctors> doctors = [];
  bool isLoading = false;
  String? error;

  Future<void> loadDoctors() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      doctors = await DoctorsApi().findDoctors();
    } catch (e) {
      error = "Ocorreu um erro ao carregar os médicos.";
    }

    isLoading = false;
    notifyListeners();
  }
}