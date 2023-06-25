import 'dart:io';

void main() {
  stdout.write('Enter a commit reference: ');
  var commitReference = stdin.readLineSync();

  if (commitReference != null && commitReference.isNotEmpty) {
    Process.run('git', ['reset', commitReference]).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git reset successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });

    Process.run('git', ['push', '-f']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git push successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });
  }
}
