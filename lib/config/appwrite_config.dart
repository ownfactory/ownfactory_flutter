/// Appwrite configuration for all build types
abstract class AppwriteConfig {
  // release config
  static const endpointProd = 'http://localhost/v1';
  static const projectIdProd = '6185a8daede7b';
  static const proxyUrlProd = '';

  // debug config
  static const endpointDev = 'http://localhost/v1';
  static const projectIdDev = '6185a8daede7b';
  static const proxyUrlDev = '';
}
