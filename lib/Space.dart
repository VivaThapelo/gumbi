class Space {
  String spaceCatered;
  int spacePrice;
  int spaceRooms;
  String spaceSection;
  String spaceStatus;
  String spaceTownship;
  String spaceElectricity;
  String spaceWater;
  int spaceLength;
  int spaceWidth;
  int spacePhone;
  String spaceOwner;
  List<String> spacePictures;

  Space(
      [String spaceCatered,
      int spacePrice,
      int spaceRooms,
      String spaceSection,
      String spaceStatus,
      String spaceTownship,
      String spaceElectricity,
      String spaceWater,
      int spaceLength,
      int spaceWidth,
      String spaceOwner,
      int spacePhone,
      List<String> spacePictures]) {
    spaceCatered = this.spaceCatered;
    spacePrice = this.spacePrice;
    spaceRooms = this.spaceRooms;
    spaceSection = this.spaceSection;
    spaceStatus = this.spaceStatus;
    spaceTownship = this.spaceTownship;
    spaceElectricity = this.spaceElectricity;
    spaceWater = this.spaceWater;
    spacePictures = this.spacePictures;
    spacePhone = this.spacePhone;
    spaceOwner = this.spaceOwner;
  }

  // class getters

  String getSpaceCatered() {
    return spaceCatered;
  }

  int getSpacePrice() {
    return spacePrice;
  }

  int getSpaceRooms() {
    return spaceRooms;
  }

  String getSpaceSection() {
    return spaceSection;
  }

  String getSpaceStatus() {
    return spaceStatus;
  }

  String getSpaceTownship() {
    return spaceTownship;
  }

  String getSpaceElectricity() {
    return spaceElectricity;
  }

  // class setters

  setSpaceCatered(String spaceCatered) {
    this.spaceCatered = spaceCatered;
  }

  setSpacePrice(int spacePrice) {
    this.spacePrice = spacePrice;
  }

  setSpaceRooms(int spaceRooms) {
    this.spaceRooms = spaceRooms;
  }

  setSpaceSection(String spaceSection) {
    this.spaceSection = spaceSection;
  }

  setSpaceStatus(String spaceStatus) {
    this.spaceStatus = spaceStatus;
  }

  setSpaceTownship(String spaceTownship) {
    this.spaceTownship = spaceTownship;
  }

  setSpaceElectricity(String spaceElectricity) {
    this.spaceElectricity = spaceElectricity;
  }

  setSpaceOwner(String spaceOwner) {
    this.spaceOwner = spaceOwner;
  }

  setSpacePhone(int spacePhone) {
    this.spacePhone = spacePhone;
  }

  setSpacePictures(List<String> spacePictures) {
    this.spacePictures = spacePictures;
  }
}
