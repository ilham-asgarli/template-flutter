import 'dart:io';

void main() async {
  stdout.write('Enter a package: ');
  var package = stdin.readLineSync();

  if (package == null || package.isEmpty) {
    package = 'build_runner';
  }

  await Process.run('dart', ['run', package, 'doctor']).then((value) {
    if (value.exitCode == 0) {
      print(value.stdout);
    } else {
      print(value.stdout);
      print(value.stderr);
    }
  });
}
