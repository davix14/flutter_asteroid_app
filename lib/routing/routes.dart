
enum AppRoutes{
  singleAsteroid('asteroid/:id'),
  home('/');

  const AppRoutes(
      this.path,
  );
  final String path;
}