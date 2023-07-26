import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/cartItems.dart';
import 'helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItems> _items = [
    CartItems(title: 'Chicken Burger',description: 'chicken patty & special sauce',price: '4.99',image: 'burgerCart2',quantity: 0),
    CartItems(title: 'Pizza',description: 'olive,onion & special sauce',price: '6.99',image: 'pizzaCart',quantity: 0),
    CartItems(title: 'Grilled Sandwich',description: 'cheese,lettuce & special sauce',price: '3.99',image: 'sandwich',quantity: 0)
  ];
  final List<String> items = [
    'Gaza',
    'Rafah',
    'Nusairat',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Help.getAssetName('threeLines'),
                            height: 30,
                            width: 30,
                          )),
                      Row(
                        children: [
                          Image.asset(
                            Help.getAssetName('location'),
                            width: 30,
                            height: 30,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Current Location',
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 0),
                                height: 40,
                                width: 100,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              iconStyleData: IconStyleData(
                                icon: Image.asset(
                                  Help.getAssetName('arrow'),
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14))),
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Help.getAssetName('bell'),
                            height: 25,
                            width: 25,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        // width: 190,
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  'Order now and',
                                  style: GoogleFonts.kurale(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: 'Enjoy your ',
                                        style: GoogleFonts.kurale(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.primary),
                                        children: [
                                      TextSpan(
                                          text: 'Meal',
                                          style: GoogleFonts.kurale(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFFFF6838)))
                                    ])),
                              ],
                            )),
                      ),
                      for(CartItems item in _items)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  fillColor: MaterialStateColor.resolveWith((states) => AppColor.orange),
                                  value: true,
                                  onChanged: (bool? val) {
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 75,
                              height: 75,
                              decoration: ShapeDecoration(
                                  color: const Color(0xFF302F3C),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: Image.asset(Help.getAssetName(item.image) ,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title,style: GoogleFonts.nunito(
                                  fontSize: 13,fontWeight: FontWeight.bold
                                ),),
                                Text(item.description,style: GoogleFonts.nunito(
                                    fontSize: 8,fontWeight: FontWeight.bold,color: Colors.grey
                                ),),
                                Text('\$${item.price}',style: GoogleFonts.nunito(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.orange
                                ),),
                              ],

                            ),
                           Transform.scale(
                             scale: 0.5,
                             child: Row(
                               children: [
                                 IconButton(onPressed: (){
                                   setState(() {
                                     if(item.quantity>0) {
                                       item.quantity--;
                                     }
                                   });
                                 }, icon: const Icon(Icons.remove)),
                                  Text(item.quantity.toString(),textScaleFactor: 2,),
                                 IconButton(onPressed: (){
                                   setState(() {
                                     if(item.quantity<9) {
                                       item.quantity++;
                                     }

                                   });
                                 }, icon: const Icon(Icons.add),color: AppColor.orange,),
                               ],
                             ),
                           )

                          ],
                        ),

                      ),
                      const SizedBox(height: 190,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {

                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),),
                              child: Text(
                                "Add More",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),),
                            const SizedBox(width: 30,),
                            TextButton(
                              onPressed: () {

                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:  AppColor.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 17),),
                              child: Text(
                                "CheckOut",
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),)
                          ],
                        ),
                      ),



                    ],
                  ))
                ]))));
  }
}
