import 'dart:io';

void main() {
  stdout.write('Enter origin: ');
  var origin = stdin.readLineSync();

  if (origin != null && origin.isNotEmpty) {
    Process.run('git', ['remote', 'set-url', 'origin', origin]);
    Process.run('git', ['remote', '-v']);
  }
}
