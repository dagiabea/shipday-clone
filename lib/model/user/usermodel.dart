class User {
  final String id;
  final String fullName;
  final String email;
  final String plate;
  final String city;
  final String phone;
  User( {required this.id, required this.fullName, required this.email, required this.phone, required this.plate, required this.city,});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        plate = data['plate'],
        city = data['city'],
        phone = data['phone'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'plate': plate,
      'city': city,
      'phone': phone,
    };
  }
}