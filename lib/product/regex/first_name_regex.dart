String? firstNameRegex(String? value) {
     if (value!.isNotEmpty) {
    if (value.contains(RegExp(r'^\S+$'))) {
      if (value.contains(RegExp(r'^\S{3,64}$'))) {
      } else {
        return "En az 3 en fazla 64 karakter giriniz";
      }
    } else {
      return "Boşluk içermeyen isim giriniz";
    }
  } else {
    return "İsim giriniz";
  }
  return null;
}



