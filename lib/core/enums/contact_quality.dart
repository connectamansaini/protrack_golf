/// Contact-quality tags captured by the 2-tap shot logger.
enum ContactQuality {
  crisp,
  thin,
  fat,
  toe,
  heel;

  String get label => switch (this) {
    ContactQuality.crisp => 'Crisp',
    ContactQuality.thin => 'Thin',
    ContactQuality.fat => 'Fat',
    ContactQuality.toe => 'Toe',
    ContactQuality.heel => 'Heel',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a [ContactQuality],
  /// falling back to [ContactQuality.crisp] if the value is unrecognized.
  static ContactQuality fromName(String name) =>
      ContactQuality.values.firstWhere(
        (contact) => contact.name == name,
        orElse: () => ContactQuality.crisp,
      );
}
