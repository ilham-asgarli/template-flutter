import 'dart:io';

void main() async {
  stdout.write('Enter a message: ');
  var message = stdin.readLineSync();

  if (message == null || message.isEmpty) {
    message = 'Initial commit';
  }

  await Process.run('git', ['add', '.']).then((value) {
    if (value.exitCode == 0) {
      print(value.stdout);
      print('Git add successful!');
    } else {
      print('Git add failed. Error: ${value.stderr}');
    }
  });

  await Process.run('git', ['commit', '-m', message]).then((value) {
    if (value.exitCode == 0) {
      print(value.stdout);
      print('Git commit successful!');
    } else {
      print('Git commit failed. Error: ${value.stderr}');
    }
  });

  await Process.run('git', ['push', '-u', 'origin', 'main']).then((value) {
    if (value.exitCode == 0) {
      print(value.stdout);
      print('Git push successful!');
    } else {
      print('Git push failed. Error: ${value.stderr}');
    }
  });
}
