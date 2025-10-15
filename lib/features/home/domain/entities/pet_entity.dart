class PetEntity {
  final String petId;
  final String petName;
  final String petOrigin;
  final String petDescription;
  final String petLifeSpan;
  final String petImageUrl;

  PetEntity({
    required this.petId,
    required this.petName,
    required this.petOrigin,
    required this.petDescription,
    required this.petLifeSpan,
    required this.petImageUrl,
  });

  factory PetEntity.fromPlaceholder() {
    return PetEntity(
      petId: 'Holder',
      petName: 'Holder',
      petOrigin: 'Holder',
      petDescription: 'Holder',
      petLifeSpan: 'Holder',
      petImageUrl: 'Holder',
    );
  }
}
