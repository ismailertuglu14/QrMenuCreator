String? nameRegex(String? value) {
  if (value!.isNotEmpty) {
    if (value.contains(RegExp(r'^\S+$'))) {
      if (value.contains(RegExp(r'^\S{3,64}$'))) {
      } else {
        return "3-64 karakter arasında olmalı";
      }
    } else {
      return "Boşluk içermeyen isim giriniz";
    }
  } else {
    return "İsim giriniz";
  }
  return null;
}


