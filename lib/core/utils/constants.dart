class AppConstants {
  // App Info
  static const String appName = 'FireTask';
  static const String appVersion = '1.0.0';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String tasksCollection = 'tasks';
  static const String projectsCollection = 'projects';
  static const String commentsCollection = 'comments';

  // Storage Paths
  static const String userProfileImagesPath = 'profile_images';
  static const String taskAttachmentsPath = 'task_attachments';

  // Shared Preferences Keys
  static const String themeModeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String userTokenKey = 'user_token';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int maxTaskTitleLength = 100;
  static const int maxTaskDescriptionLength = 1000;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultIconSize = 24.0;

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
}
