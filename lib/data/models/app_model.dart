class AppModel {
  final String title;
  final String description;
  final String image;
  final String logo;
  final String githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webUrl;

  const AppModel({
    required this.title,
    required this.description,
    required this.image,
    required this.logo,
    required this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webUrl,
  });
}
