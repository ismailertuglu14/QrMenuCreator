String? emailRegex(String? value) {
  return value!.isNotEmpty && value.contains(RegExp(r'^\S+@\S+\.\S+$'))
      ? null
      : "Email adres giriniz ve boşluk içermemeli";
}
