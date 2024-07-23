enum Social {
  instagram(icon: "assets/icons/instagram.svg", label: "instagram"),
  facebook(icon: "assets/icons/facebook.svg", label: "facebook"),
  twitter(icon: "assets/icons/twitter.svg", label: "twitter"),
  youtube(icon: "assets/icons/youtube.svg", label: "youtube");

  final String icon;
  final String label;
  const Social({required this.icon, required this.label});
}
