String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password cannot be blank.';
  } else {
    return null;
  }
}
