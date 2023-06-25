import 'dart:io';

void main() async {
  stdout.write('Enter a message: ');
  var message = stdin.readLineSync();

  if (message == null || message.isEmpty) {
    message = 'Initial commit';
  }

  await Process.run('git', ['add', '.']);
  await Process.run('git', ['commit', '-m', message]);
  await Process.run('git', ['push', '-u', 'origin', 'main']);
}
