public class AnimalLocator {
    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        Map<String,Object> animalValue = new Map<String,Object>();
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animalValue = (Map<String,Object>)result.get('animal');
            System.debug(animalValue.get('name'));
        }
        return ((String)animalValue.get('name'));
    }
}