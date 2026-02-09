class AppRoutes {
  static const String splash = '/splash';

  // Shell branches
  static const String home = '/home';
  static const String overview = '/overview';
  static const String repeated = '/repeated';

  // Details
  static const String section = '/section/:sectionId';

  static String sectionPath(String id) => '/section/$id';
}
