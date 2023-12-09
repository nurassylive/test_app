enum AppRoutes {
  // Initial
  initial('/', '/'),
  login('login', '/login'),

  news('news', '/news'),
  map('map', '/map'),
  favorites('favorites', '/favorites'),
  profile('profile', '/profile');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
