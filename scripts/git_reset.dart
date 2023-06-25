import 'dart:io';

void main() {
  stdout.write('Enter a commit reference: ');
  var commitReference = stdin.readLineSync();

  if (commitReference != null && commitReference.isNotEmpty) {
    Process.run('git', ['reset', commitReference]);
    Process.run('git', ['push', '-f']);
  }
}
