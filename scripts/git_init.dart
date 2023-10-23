import 'dart:io';

void main() async {
  stdout.write('Enter origin: ');
  var origin = stdin.readLineSync();

  if (origin != null && origin.isNotEmpty) {
    await Process.run('git', ['init']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git init successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git init failed.');
      }
    });

    await Process.run('git', ['branch', '-M', 'main']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git branch successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git branch failed.');
      }
    });

    await Process.run('git', ['remote', 'add', 'origin', origin]).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git remote origin successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git remote origin failed.');
      }
    });

    await Process.run('dart', ['scripts/git_push.dart']).then((value) {
      if (value.exitCode == 0) {
        print(value.stdout);
        print('Git git-push start successful!');
      } else {
        print(value.stdout);
        print(value.stderr);
        print('Git git-push start failed.');
      }
    });
  }
}
