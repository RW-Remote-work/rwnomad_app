class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String login = '/web/auth/login';
  static const String logout = '/web/auth/logout';
  static const String register = '/web/register';
  static const String verifyCode = '/web/verify-code';
  static const String resetPasswordEmail =
      '/web/user/password/reset-password-email';
  static const String resetPassword = '/web/user/password/reset-password';

  // User
  static const String userProfile = '/web/users/profile';
  static const String updateDisplayName = '/web/users/display-name';
  static const String updateAvatarUrl = '/web/users/avatar-url';
  static const String updateAvatar = '/web/users/avatar';

  // Jobs
  static const String jobList = '/web/jobs/list';
  static const String jobDetail = '/web/jobs/detail';
  static const String jobApply = '/web/jobs';
  static const String jobDeliver = '/web/jobs';
  static const String jobOnlineCount = '/web/jobs/online/count';

  // Favorites
  static const String favorites = '/favorites/jobs';

  // Apply
  static const String appliedJobs = '/apply/jobs';

  // Reference data
  static const String jobClasses = '/job/classes/list';
  static const String jobLabels = '/job/labels';
  static const String countries = '/regions/countries';
  static const String provinces = '/regions/provinces';
  static const String cities = '/regions/cities';
  static const String currencies = '/currency/all';

  // Shell (for profile)
  static const String shellAccount = '/shell/account';
}
