class ApiException implements Exception {
  String message;

  final Map<String, String> msg = {
    "PAS_INTERNET" : "Serveur indisponible ou aucun accès internet",
    "ERREUR_SERVEUR" : "Serveur indisponible ou aucun accès internet"
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
