enum ServicePaths {
  login('/auth/login'),
  register('/users/add');

  final String path;
  const ServicePaths(this.path);
}
