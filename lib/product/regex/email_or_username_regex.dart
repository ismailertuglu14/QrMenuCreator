String? emailorUsernameRegex(String? value) {
  if (value!.isNotEmpty) {
    if (value.contains(RegExp(r'^\S+$'))) {
      if (value.contains(RegExp(r'^.{3,64}$'))) {
        if (value.contains("@")) {
          if (value.contains(RegExp(
              r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$'))) {
          } else {
            return "Geçerli email adresi giriniz";
          }
        }
      } else {
        return "Email veya şifre 3-64 karakter olmalıdır";
      }
    } else {
      return "Email veya kullanıcı adı boşluklu olamaz";
    }
  } else {
    return "Email adresi veya kullanıcı adı giriniz";
  }
  return null;
}
