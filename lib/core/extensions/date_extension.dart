extension DateExtension on DateTime {
  String formatDateSpanish() {
    const months = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '$day de ${months[month - 1]}, ${twoDigits(hour)}:${twoDigits(minute)}';
  }
}
