import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/data.dart';
import 'package:smart_home/smart_item_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  void toggleSwitch(bool value, int index) {
    setState(() {
      devices[index].isEnabled = value;

      if (value) {
        // Start the timer
        devices[index].timerCount = 0;
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          setState(() {
            devices[index].timerCount = timer.tick;
          });
        });
      } else {
        // Stop the timer
        devices[index].timerCount = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Kobicypher!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1F2B1A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Color(0xFF1F2B1A),
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF1F2B1A),
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/banner.png',
                    scale: 1.2,
                    height: 60,
                    width: 60,
                    //
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Smart Devices",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF1F2B1A),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    return SmartItemContainer(
                      title: devices[index].name,
                      imagePath: devices[index].image,
                      isOn: devices[index].isEnabled,
                      timerCount: devices[index].timerCount,
                      onTap: () {
                        toggleSwitch(!devices[index].isEnabled, index);
                      },
                    );
                  },
                ),
              ),

              // Bottom Navigation Bar
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1F2B1A),
        child: const Icon(
          Icons.power_settings_new,
          color: Colors.white,
        ),
      ),
    );
  }
}
