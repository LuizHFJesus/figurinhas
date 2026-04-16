class AppRoutes {
  // Shell branches
  static const String home = '/home';
  static const String overview = '/overview';
  static const String repeated = '/repeated';

  // Section
  static const String section = '/section/:sectionId';

  // Stats
  static const String stats = '/stats';

  static String sectionPath(String id) => '/section/$id';
}
