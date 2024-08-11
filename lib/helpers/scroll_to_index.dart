part of 'scroll_to_key.dart';

void scrollToIndex(int index) async {
  if (index == 5) {
    await launchUrl(Uri.parse("https://www.google.com"));
    return;
  }

  scrollToKey(index);
}
