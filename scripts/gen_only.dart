import 'dart:io';

void main() async {
  stdout
      .write('Enter a file relative path to be generated (lib/file.g.dart): ');
  var file = stdin.readLineSync();

  if (file == null || file.isEmpty) {
    return;
  }

  await Process.run('dart', [
    'run',
    'build_runner',
    'build',
    '--build-filter=$file',
  ]).then((value) {
    if (value.exitCode == 0) {
      print(value.stdout);
    } else {
      print(value.stdout);
      print(value.stderr);
    }
  });
}
