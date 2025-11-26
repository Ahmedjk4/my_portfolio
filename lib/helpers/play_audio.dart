import 'package:universal_html/html.dart' as html;

void playAudio() async {
  final audioElement = html.AudioElement();
  audioElement.src = 'assets/assets/audiomusic.mp3';
  audioElement.play();
  audioElement.autoplay = true;
  audioElement.loop = true;
}
