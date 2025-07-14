enum TempleteStatus {
  WORKING,
  AVAILABLE,
  PENDING;

  String get value {
    switch (this) {
      case TempleteStatus.WORKING:
        return 'WORKING';
      case TempleteStatus.AVAILABLE:
        return 'AVAILABLE';
      case TempleteStatus.PENDING:
        return 'PENDING';
    }
  }
}
