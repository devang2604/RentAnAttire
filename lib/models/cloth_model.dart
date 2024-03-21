class ClothModel {
  String currentPrice;
  String oldPrice;
  String name;
  String clothimage; // Add the type String here

  ClothModel({
    required this.currentPrice,
    required this.oldPrice,
    required this.name,
    required this.clothimage, // Make sure the type matches
  });
}

final List<ClothModel> cloth = [
  ClothModel(
    clothimage:
        'https://res.cloudinary.com/dssr9wa3x/image/upload/v1711001019/cloth/00e2d286948ec0bdbc11ee7bc95f6508-removebg-preview_psytjo.png',
    name: 'Raaya',
    currentPrice: '3,499.00',
    oldPrice: '4,499.00',
  ),
  ClothModel(
    clothimage:
        'https://res.cloudinary.com/dssr9wa3x/image/upload/v1711001991/cloth/3559c5e4ee0eb96d3b84f8c84e5ad0eb-removebg-preview_n5zqqa.png',
    name: 'Nero By Shaifali & Satya',
    currentPrice: '2,499.00',
    oldPrice: '3,799.00',
  ),
  ClothModel(
    clothimage:
        'https://res.cloudinary.com/dssr9wa3x/image/upload/v1711002076/cloth/1b212bbe0d5f47790e3b2f994b418bbe-removebg-preview_hszede.png',
    name: 'The Maroon Suit',
    currentPrice: '3,999.00',
    oldPrice: '4,499.00',
  ),
  ClothModel(
    clothimage:
        'https://res.cloudinary.com/dssr9wa3x/image/upload/v1711002116/cloth/54de878199aa04e75dba99aea16d1654-removebg-preview_knccap.png',
    name: 'Seema Gujral',
    currentPrice: '17,999.00',
    oldPrice: '19,999.00',
  ),
  ClothModel(
    clothimage:
        'https://res.cloudinary.com/dssr9wa3x/image/upload/v1711002223/cloth/f808ebd1e26c28961705060c469861e3-removebg-preview_schxsg.png',
    name: 'LDS',
    currentPrice: '6,499.00',
    oldPrice: '7,999.00',
  ),
];
