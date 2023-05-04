
import 'package:ecommerce_app/Utils/product_ecom.dart';
import 'package:ecommerce_app/Utils/widget_custom.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? Selecategory;
  RangeValues rangeValues = const RangeValues(1, 2000);

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.40;
    double w = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: Selecategory,
                    hint: const Text("select category..."),
                    items: Category.map(
                          (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        Selecategory = val;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: Selecategory != null,
                  child: ActionChip(
                    avatar: const Icon(Icons.clear),
                    label: const Text("Clear"),
                    onPressed: () {
                      setState(() {
                        Selecategory = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: Selecategory != null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("From \n\$ ${rangeValues.start.toInt()}"),
                    Expanded(
                      child: RangeSlider(
                        values: rangeValues,
                        divisions: 2000,
                        labels: RangeLabels(
                            rangeValues.start.toInt().toString(),
                            rangeValues.end.toInt().toString()),
                        min: 1,
                        max: 2000,
                        onChanged: (val) {
                          setState(() {
                            rangeValues = val;
                          });
                        },
                      ),
                    ),
                    Text("From \n\$ ${rangeValues.end.toInt()}"),
                  ],
                ),
              ),
            ),
            (Selecategory != null)
                ? getproduct(
                category: Selecategory!,
                name: Selecategory!,
                minprice:rangeValues.start,
                maxprice:rangeValues.end
                )
                : Column(
                  children: [
                    getproduct(category: "smartphones", name: "Smartphones"),
                    getproduct(category: "laptops", name: "Laptops"),
                    getproduct(category: "fragrances", name: "Fragrances"),
                    getproduct(category: "skincare", name: "Skincare"),
                    getproduct(category: "groceries", name: "Groceries"),
                    getproduct(category: "home-decoration", name: "Home-Decoration"),

              ],
            ),
          ],
        ),
      ),
    );
  }
}