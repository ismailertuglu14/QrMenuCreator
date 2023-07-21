String? phoneRegex(String? value) {
  if (value!.isEmpty) {
    return "Please Enter a Phone Number";
  } else if (!RegExp(
          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
      .hasMatch(value)) {
    return "Please Enter a Valid Phone Number";
  }
  return null;
}
