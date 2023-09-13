import 'dart:io';

void main() {
  stdout.write('Enter origin: ');
  var origin = stdin.readLineSync();

  if (origin != null && origin.isNotEmpty) {
    Process.run('git', ['init']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git init successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });

    Process.run('git', ['branch', '-M', 'main']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git branch successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });

    Process.run('git', ['remote', 'add', 'origin', origin]).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git remote successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });

    Process.run('dart', ['scripts/git_push.dart']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git git-push start successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git push failed.');
      }
    });
  }
}
