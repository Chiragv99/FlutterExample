class RegisterUser {

  String firstname;
  String lastname;
  String email;
  String password;


  RegisterUser(
      {required this.firstname, required this.lastname, required this.email, required this.password});


  RegisterUser.fromMap(Map<String, dynamic> result)
      : firstname = result["firstname"],
        lastname = result["lastname"],
        email = result["email"],
        password = result["password"];


  Map<String, Object> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password
    };
  }

}