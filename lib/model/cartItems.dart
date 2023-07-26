class CartItems{
  final String title;
  final String description;
  final String price;
  final String image;
   int quantity;
  bool checked;

  CartItems( {required this.title,required this.description,required this.price,required this.image,required this.quantity, this.checked = false});
}