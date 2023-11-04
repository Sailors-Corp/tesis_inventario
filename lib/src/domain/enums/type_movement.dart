enum TypeMovement {
  simpleInterno,
  simpleExterno,
  multipleInterno,
  multipleExterno;

  const TypeMovement();

  static TypeMovement getByName(String name) => switch (name) {
        'simple interno' => TypeMovement.simpleInterno,
        'simple externo' => TypeMovement.simpleExterno,
        'multiple interno' => TypeMovement.multipleInterno,
        'multiple externo' => TypeMovement.multipleExterno,
        (_) => TypeMovement.simpleInterno
      };

  @override
  String toString() => switch (this) {
        TypeMovement.simpleInterno => 'simple interno',
        TypeMovement.simpleExterno => 'simple externo',
        TypeMovement.multipleInterno => 'multiple interno',
        TypeMovement.multipleExterno => 'multiple externo',
      };
}
