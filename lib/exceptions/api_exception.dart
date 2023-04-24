class ApiException implements Exception {
  String message;

  final Map<String, String> msg = {
    "PAS_INTERNET": "Pas de connexion Internet",
    "ERREUR_SERVEUR": "Une erreur est survenue"
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
