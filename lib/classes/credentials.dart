class Credentials {

  String login, password;

  Credentials(String login, String password) {
    this.login = login;
    this.password = password;
  }

  void setField(field, value) {
    switch(field) {
      case "login":
        this.login = value;
        break;
      case "password":
        this.password = value;
        break;
    }
  }

}