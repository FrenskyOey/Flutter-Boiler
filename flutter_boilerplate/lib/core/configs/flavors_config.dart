enum Flavor { staging, production }

class FlavorConfig {
  String title = '';
  String baseUrl = '';
  String env = '';
  Flavor? flavor;
}
