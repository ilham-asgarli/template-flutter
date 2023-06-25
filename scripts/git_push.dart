import 'dart:io';

void main() async {
  ProcessResult result;

  stdout.write('Enter a message: ');
  var message = stdin.readLineSync();

  if (message == null || message.isEmpty) {
    message = 'Initial commit';
  }

  result = await Process.run('git', ['add', '.']);
  if (result.exitCode == 0) {
    print(result.stdout);
    print('Git add successful!');
  } else {
    print(result.stdout);
    print(result.stderr);
    print('Git push failed.');
  }

  result = await Process.run('git', ['commit', '-m', message]);
  if (result.exitCode == 0) {
    print(result.stdout);
    print('Git commit successful!');
  } else {
    print(result.stdout);
    print(result.stderr);
    print('Git push failed.');
  }

  result = await Process.run('git', ['push', '-u', 'origin', 'main']);
  if (result.exitCode == 0) {
    print(result.stdout);
    print('Git push successful!');
  } else {
    print(result.stdout);
    print(result.stderr);
    print('Git push failed.');
  }
}
