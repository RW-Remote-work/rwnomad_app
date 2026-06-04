class SalaryFormatter {
  SalaryFormatter._();

  static String format({
    int? minSalary,
    int? maxSalary,
    String? salaryType,
    String? currencyCode,
    String negotiableText = 'Salary negotiable',
  }) {
    final currency = currencyCode ?? '';
    final min = _formatNumber(minSalary);
    final max = _formatNumber(maxSalary);
    final type = _salaryTypeLabel(salaryType);

    if (min != null && max != null) {
      return '$currency $min - $max $type';
    } else if (min != null) {
      return '$currency $min $type';
    } else if (max != null) {
      return '$currency Up to $max $type';
    }
    return negotiableText;
  }

  static String? _formatNumber(int? num) {
    if (num == null || num == 0) return null;
    if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(0)}K';
    }
    return num.toString();
  }

  static String _salaryTypeLabel(String? type) {
    switch (type) {
      case 'MONTHLY_PAY':
        return '/month';
      case 'YEARLY_PAY':
        return '/year';
      case 'DAY_PAY':
        return '/day';
      case 'HOUR_PAY':
        return '/hour';
      case 'WEEKLY_PAY':
        return '/week';
      default:
        return '';
    }
  }
}
