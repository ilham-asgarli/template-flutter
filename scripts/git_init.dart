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
        print('Git init failed. Error: ${value.stderr}');
      }
    });

    Process.run('git', ['branch', '-M', 'main']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git branch successful!');
      } else {
        print('Git branch failed. Error: ${value.stderr}');
      }
    });

    Process.run('git', ['remote', 'add', 'origin', origin]).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git remote successful!');
      } else {
        print('Git remote failed. Error: ${value.stderr}');
      }
    });

    Process.run('dart', ['git_push.dart']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git git-push start successful!');
      } else {
        print('Git git-push start failed. Error: ${value.stderr}');
      }
    });
  }
}
