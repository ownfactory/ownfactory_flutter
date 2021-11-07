/// Application assembly types
/// When building from the CLI, they are governed by the assembly from the corresponding file
/// main-\***.dart
enum BuildType {
  /// Debug build type
  debug,

  /// Release build type
  release,

  /// Qa build type
  qa,

  /// Unit test with fake data source
  test,
}
