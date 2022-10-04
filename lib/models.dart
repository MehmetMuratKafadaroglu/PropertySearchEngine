import 'settings.dart';

class Property {
  Property(
    this.id,
    this.price,
    this.isForSale,
    this.numberOfRooms,
    this.location,
    this.address,
    this.internalArea,
    this.title,
    this.description,
    this.publishDate,
    this.authorID,
    this.orienter,
    this.propertyType,
    this.images,
    this.isPublished,
  );
  int id;
  final int price, numberOfRooms, internalArea, authorID;
  final bool isForSale, isPublished;
  final String location,
      address,
      title,
      description,
      publishDate,
      orienter,
      propertyType;
  final List<String>? images;
  get date => publishDate.split("T")[0];
  get type => propertyType.trim();
  factory Property.empty() {
    return Property(
        0, 0, false, 0, '', '', 0, '', '', '', 0, '', '', [], false);
  }

  factory Property.fromJson(Map map) {
    return Property(
      map['id'],
      map['price'],
      map['isForSale'],
      map['numberOfRooms'],
      map['location'],
      map['address'],
      map['internalArea'],
      map['title'],
      map['description'],
      map['publishDate'],
      map['authorID'],
      map['orienter'],
      map['propertyType'],
      map['images'],
      map['isPublished'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'isForSale': isForSale,
      'numberOfRooms': numberOfRooms,
      'location': location,
      'address': address,
      'internalArea': internalArea,
      'title': title,
      'description': description,
      'publishDate': publishDate,
      'authorID': authorID,
      'orienter': orienter,
      'images': images,
      'isPublished': isPublished
    };
  }
}

class PropertyImage {
  const PropertyImage(this.id, this.fileName);
  final int id;
  final String fileName;
  get image => "${Settings.url}/$fileName";
  factory PropertyImage.empty() => PropertyImage(0, '');
  factory PropertyImage.fromJson(Map<String, dynamic> map) {
    return PropertyImage(map['id'], map['fileName']);
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'fileName': fileName};
  }
}

class PropertyWithImage {
  const PropertyWithImage(this.property, this.propertyImages);
  final Property property;
  final List<PropertyImage> propertyImages;

  factory PropertyWithImage.redirectToLogin() {
    PropertyWithImage propertyWithImage = PropertyWithImage.empty();
    propertyWithImage.property.id = -1;
    return propertyWithImage;
  }
  factory PropertyWithImage.empty() => PropertyWithImage(Property.empty(), []);
  factory PropertyWithImage.fromJson(Map<String, dynamic> map) {
    Property property = Property.fromJson(map['property']);
    List<PropertyImage> list = [];
    if (map['propertyImages'] != null) {
      for (var image in map['propertyImages']) {
        list.add(PropertyImage.fromJson(image));
      }
    }
    return PropertyWithImage(property, list);
  }

  Map<String, dynamic> toMap() {
    return {'property': property, "propertyImage": propertyImages};
  }
}

class User {
  const User(this.id, this.email, this.password, this.isMailVerified,
      this.companyName, this.isAgent, this.phoneNumber);
  final bool isMailVerified, isAgent;
  final String email, password, companyName;
  final int id, phoneNumber;

  factory User.fromJson(Map<String, dynamic> map) {
    return User(map['id'], map['email'], map['password'], map['isMailVerified'],
        map['companyName'], map['isAgent'], map['phoneNumber']);
  }
  factory User.emptyUser() {
    return User(0, '', '', false, '', false, 0);
  }
  factory User.fromEmailandPassword(String email, password) {
    return User(0, email, password, false, '', false, 0);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'isMailVerified': isMailVerified,
      'companyName': companyName,
      'isAgent': isAgent,
      'phoneNumber': phoneNumber
    };
  }
}
