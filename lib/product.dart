import 'package:dpit/productController.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ProductController productController = ProductController();
  bool isloading = false;

Future<void> getProduct() async {

  setState(() {
    isloading = true;
  });
  await productController.readProduct();

  setState(() {
    isloading = false;
  });

}

  void productDialog(
      {String? id,
        String? name,
        int? qty,
        String? img,
        int? unitPrice,
        int? totalPrice}) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productcodeController = TextEditingController();
    TextEditingController productQtyController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    productNameController.text = name ?? '';
    productQtyController.text = qty != null ? qty.toString() : '0';
    productImageController.text = img ?? '';

    productUnitPriceController.text =unitPrice  != null ?  unitPrice.toString() : '0';
    productTotalPriceController.text =totalPrice !=null ? totalPrice.toString() : '0';

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(id == null ? 'Add product' : 'Update product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(labelText: 'Product name'),
              ),
              TextField(
                controller: productImageController,
                decoration: InputDecoration(labelText: 'Product Image'),
              ),
              TextField(
                controller: productQtyController,
                decoration: InputDecoration(labelText: 'Product Qty'),
              ),
              TextField(
                controller: productUnitPriceController,
                decoration:
                InputDecoration(labelText: 'Product unit price'),
              ),
              TextField(
                controller: productTotalPriceController,
                decoration: InputDecoration(labelText: 'Total price'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close')),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (id == null) {
                          productController.createProduct(
                              productNameController.text,
                              productImageController.text,
                              int.parse(productQtyController.text),
                              int.parse(productUnitPriceController.text),
                              int.parse(productTotalPriceController.text));
                        } else {
                          productController.UpdateProduct(
                              id,
                              productNameController.text,
                              productImageController.text,
                              int.parse(productQtyController.text),
                              int.parse(productUnitPriceController.text),
                              int.parse(productTotalPriceController.text));
                        }

                         await productController.readProduct();
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text(
                          id == null ? 'Add product' : 'Update product')),
                ],
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
      body:     isloading  ? Center(child: CircularProgressIndicator(),) :
        ListView.builder(
        itemCount: productController.products.length,
          itemBuilder: (context,index){
          var product =  productController.products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product.img.toString()),
              title: Text(product.productName.toString()),
              subtitle: Text('Price: ${product.unitPrice}| Qrt : ${product.qty}| Total: ${product.totalPrice} '),
              trailing: IconButton(onPressed: (){

                productController.deleteProducts(product.sId.toString()).then((value) async {
                  if (value) {
                    await productController.readProduct();
                    setState(() {

                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Product deleted"),
                        duration: Duration(seconds: 2),

                      ),
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Something wrong try again"),
                        duration: Duration(seconds: 2),

                      ),
                    );
                  }
                });

              }, icon: Icon(Icons.delete,color: Colors.red,)),
            ),
          );
          }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add,size: 40,color: Colors.white,),onPressed:productDialog,),
    );
  }
}
