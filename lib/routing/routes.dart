
enum AppRoutes{
  home('/', 'home'),
  singleAsteroid('/asteroid-detail', 'singleAsteroid'),
  fullscreenImageOfTheDay('/fullscreenImageOfTheDay', 'fullscreenImageOfTheDay');

  const AppRoutes(
      this.path,
      this.name
  );
  final String path;
  final String name;
}