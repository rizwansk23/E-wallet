String obscureText(String text, int visibleCount) {
  if (text.length <= visibleCount) return text;

  String hidden = "*" * (text.length - visibleCount);
  String visible = text.substring(text.length - visibleCount);

  return hidden + visible;
}

String obscure(String text, bool isVisible) {

  String rupee ='\u20B9 ' ;

  if (isVisible){

  String hidden = "*" * text.length;

  return rupee + hidden;
  }else {
    return rupee + text;
  }
}