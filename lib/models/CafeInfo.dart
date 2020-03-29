//The information that needs to be parsed from backedn
class CafeInfo {
  String imageLink; //url of the image
  String imageTitle; //Parkside Canteen, etc
  String imageType; //Cafeteria, etc
  int walkMin; //17 mins, etc
  double stars; //The ratings of the restaurant
  String mapLink;
  String address;
  String phoneNumber;

  List<String> foodImageLinks;
  List<String> foodNames;

  CafeInfo(
      {this.imageLink,
      this.imageTitle,
      this.imageType,
      this.walkMin,
      this.stars,
      this.mapLink,
      this.address,
      this.phoneNumber});
}