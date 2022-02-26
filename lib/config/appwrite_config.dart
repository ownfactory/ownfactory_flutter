/// Appwrite configuration for all build types
abstract class AppwriteConfig {
  // release config
  static const endpointProd = 'http://localhost/v1';
  static const projectIdProd = '619975e71e6e0';
  static const proxyUrlProd = '';

  // debug config
  static const endpointDev = 'http://localhost/v1';
  static const projectIdDev = '619975e71e6e0';
  static const proxyUrlDev = '';
}
