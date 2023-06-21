String? passwordRegex(String? value) {
  if (value != null && value.isNotEmpty) {
    if (!value.contains(RegExp(r'\s'))) {
      if (value.contains(RegExp(r'^[a-zA-Z0-9_-]{3,64}$'))) {
      } else {
        return "Şifreniz 3-64 karakter olmalıdır";
      }
    } else {
      return "Şifreniz boşluk içermemeli";
    }
  } else {
    return "Şifre giriniz";
  }
  return null;
}
