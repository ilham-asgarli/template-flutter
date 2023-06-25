import 'dart:io';

void main() {
  stdout.write('Enter origin: ');
  var origin = stdin.readLineSync();

  if (origin != null && origin.isNotEmpty) {
    Process.run('git', ['init']);
    Process.run('git', ['branch', '-M', 'main']);
    Process.run('git', ['remote', 'add', 'origin', origin]);
    Process.run('dart', ['git_push.dart']);
  }
}
