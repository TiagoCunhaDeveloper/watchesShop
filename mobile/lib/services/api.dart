
import 'package:http/http.dart' as http;
const baseUrl = "http://192.168.15.2:3333";

class API {
    static Future getProducts() async{
        var url = baseUrl + "/products";
        return await http.get(url);
    }

    static Future showProduct(id) async{
        var url = baseUrl + "/products/" + id;
        return await http.get(url);
    }
}