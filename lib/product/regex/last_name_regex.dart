
String? lastNameRegex(String? value) {
   
  return value!.isNotEmpty && value.contains(RegExp(r'^\S{3,64}$'))
      ? null
      : "En az 3 en fazla 64 karakterli ve boşluk içermeyen isim giriniz";
}





