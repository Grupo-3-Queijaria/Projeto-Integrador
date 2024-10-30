class Validators {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'O campo de e-mail não pode estar vazio';
    }
    // Verifica se o e-mail tem o formato correto
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'O campo de senha não pode estar vazio';
    }
    if (password.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  static String? validateField(String value, String fieldName) {
    if (value.isEmpty) {
      return 'O campo $fieldName não pode estar vazio';
    }
    return null;
  }
}
