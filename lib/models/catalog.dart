// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class catalog {
//   String? id;
//   String? name;
//   String? desc;
//   num? price;
//   String? color;
//   String? image;
//   catalog({
//     this.id,
//     this.name,
//     this.desc,
//     this.price,
//     this.color,
//     this.image,
//   });


//   catalog copyWith({
//     String? id,
//     String? name,
//     String? desc,
//     num? price,
//     String? color,
//     String? image,
//   }) {
//     return catalog(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       desc: desc ?? this.desc,
//       price: price ?? this.price,
//       color: color ?? this.color,
//       image: image ?? this.image,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'desc': desc,
//       'price': price,
//       'color': color,
//       'image': image,
//     };
//   }

//   factory catalog.fromMap(Map<String, dynamic> map) {
//     return catalog(
//       id: map['id'] != null ? map['id'] as String : null,
//       name: map['name'] != null ? map['name'] as String : null,
//       desc: map['desc'] != null ? map['desc'] as String : null,
//       price: map['price'] != null ? map['price'] as num : null,
//       color: map['color'] != null ? map['color'] as String : null,
//       image: map['image'] != null ? map['image'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory catalog.fromJson(String source) => catalog.fromMap(json.decode(source) as Map<String, dynamic>);


//   @override
//   String toString() {
//     return 'catalog(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
//   }

//   @override
//   bool operator ==(covariant catalog other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.id == id &&
//       other.name == name &&
//       other.desc == desc &&
//       other.price == price &&
//       other.color == color &&
//       other.image == image;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       name.hashCode ^
//       desc.hashCode ^
//       price.hashCode ^
//       color.hashCode ^
//       image.hashCode;
//   }
// }
