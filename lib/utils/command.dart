class Command {
  final Function execute;
  final Function? canExecute;
  Command({required this.execute, this.canExecute});
  void call() {
    if (canExecute == null || canExecute!()) {
      execute();
    }
  }
}
