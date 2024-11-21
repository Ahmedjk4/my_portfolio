class ProjectModel {
  final String title;
  final String subtitle;
  final String image;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;
  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}
