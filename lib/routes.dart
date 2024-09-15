import 'package:flutter/material.dart';
import 'package:integrador/views/contrato/add_contrato_view.dart';
import 'package:integrador/views/contrato/contrato_list_view.dart';
import 'package:integrador/views/curso/add_curso_view.dart';
import 'package:integrador/views/curso/curso_list_view.dart';
import 'package:integrador/views/propriedade/add_propriedade_view.dart';
import 'package:integrador/views/propriedade/propriedade_list_view.dart';
import 'package:integrador/views/tecnologia/add_tecnologia_view.dart';
import 'package:integrador/views/tecnologia/tecnologia_list_view.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/auth/forgot_password_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/propriedade':
        return MaterialPageRoute(builder: (_) => PropriedadeListView());
      case '/add-propriedade':
        return MaterialPageRoute(builder: (_) => AddPropriedadeView());
      case '/contrato':
        return MaterialPageRoute(builder: (_) => ContratoListView());
      case '/add-contrato':
        return MaterialPageRoute(builder: (_) => AddContratoView());
      case '/tecnologia':
        return MaterialPageRoute(builder: (_) => TecnologiaListView());
      case '/add-tecnologia':
        return MaterialPageRoute(builder: (_) => AddTecnologiaView());
      case '/curso':
        return MaterialPageRoute(builder: (_) => CursoListView());
      case '/add-curso':
        return MaterialPageRoute(builder: (_) => AddCursoView());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupView());
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
