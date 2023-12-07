class ApiException implements Exception {
  String message;

  final Map<String, String> msg = {
    "PAS_INTERNET" : "Problème de connexion",
    "ERREUR_SERVEUR" : "Problème de connexion"
  };

  ApiException(this.message){
    bool hasKey = msg.containsKey(this.message);
    if(hasKey){
      this.message = msg[this.message].toString();
    }
  }

  @override
  String toString() {
    return message;
  }
}
