class Urls{
   static String baseUrl = 'http://35.73.30.144:2008/api/v1';
   static String readProduct = '$baseUrl/ReadProduct';
   static String createProduct = '$baseUrl/CreateProduct';
   static String updateProduct(String productId) => '$baseUrl/UpdateProduct/$productId';
   static String deleteProduct(String productId) => '$baseUrl/DeleteProduct/$productId';

}