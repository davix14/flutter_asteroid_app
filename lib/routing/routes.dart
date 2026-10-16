
enum AppRoutes{
  home('/', 'home'),
  neoSearch('/neo-search', 'neoSearch'),
  singleAsteroid('asteroid-detail', 'singleAsteroid'),
  fullscreenImageOfTheDay('fullscreenImageOfTheDay', 'fullscreenImageOfTheDay');

  const AppRoutes(
      this.path,
      this.name
  );
  final String path;
  final String name;
}