import 'dart:io';

void main() {
  stdout.write('Enter origin: ');
  var origin = stdin.readLineSync();

  if (origin != null && origin.isNotEmpty) {
    Process.run('git', ['remote', 'set-url', 'origin', origin]).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git set-url successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });

    Process.run('git', ['remote', '-v']);
  }
}
