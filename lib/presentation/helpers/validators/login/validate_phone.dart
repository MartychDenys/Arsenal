String validatePhone(String value) {
  if (value.isEmpty) {
    return 'Phone cannot be blank.';
  } else if (value.length > 9) {
    return 'Phone number must be shorter';
  } else if (value.length < 9) {
    return 'Phone number must be longer';
  } else {
    return null;
  }
}

String validateResetPhone(String value) {
  if (value.isEmpty) {
    return 'Phone cannot be blank.';
  } else if (value.length > 12) {
    return 'Phone number must be shorter';
  } else if (value.length < 12) {
    return 'Phone number must be longer';
  } else {
    return null;
  }
}
