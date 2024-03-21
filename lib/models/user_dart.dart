class UserData {
  String email;
  String phone;

  UserData({
    this.email = "",
    this.phone = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'],
      phone: map['phone'],
    );
  }
}
