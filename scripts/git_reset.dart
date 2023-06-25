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
        print('Git reset failed. Error: ${value.stderr}');
      }
    });

    Process.run('git', ['push', '-f']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git push successful!');
      } else {
        print('Git push failed. Error: ${value.stderr}');
      }
    });
  }
}
