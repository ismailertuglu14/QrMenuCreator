String? userNameRegex(String? value) {
  if (value!.isNotEmpty) {
    if (value.contains(RegExp(r'^\S+$'))) {
      if (value.contains(RegExp(r'^[a-zA-Z0-9_-]{3,64}$'))) {
      } else {
        return "Kullanıcı adı 3-64 karakter olmalıdır";
      }
    } else {
      return "Kullanıcı adı içermemeli";
    }
  } else {
    return "Kullanıcı adı giriniz";
  }
  return null;
}
