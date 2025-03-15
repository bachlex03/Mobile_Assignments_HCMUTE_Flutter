import 'package:flutter/material.dart';
import 'package:gomoon_app/widgets/Dropdown.widget.dart';

class HomePage extends StatelessWidget {
  late double _deviceWidth;
  late double _deviceHeight;
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _deviceWidth,
          height: _deviceHeight,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_title(), _bookRideWidget()],
              ),
              Align(alignment: Alignment.centerRight, child: _astroImage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropdown(),
          _travelersDropdown(),
          _bookRideButton(),
        ],
      ),
    );
  }

  Widget _destinationDropdown() {
    List<String> _items = ["Mars", "Jupiter"];

    return DropdownWidget(width: _deviceWidth, items: _items);
  }

  Widget _travelersDropdown() {
    List<String> _items1 = ["1", "2", "3", "4", "5"];
    List<String> _items2 = ["Economy", "Business", "First"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownWidget(width: _deviceWidth * 0.45, items: _items1),
        DropdownWidget(width: _deviceWidth * 0.40, items: _items2),
      ],
    );
  }

  Widget _title() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        fontSize: 70,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _astroImage() {
    return Container(
      width: _deviceWidth * 0.65,
      height: _deviceHeight * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }

  Widget _bookRideButton() {
    return Container(
      width: _deviceWidth,
      margin: EdgeInsets.only(
        top: 0,
        left: 0,
        right: 0,
        bottom: _deviceHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book a ride!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
