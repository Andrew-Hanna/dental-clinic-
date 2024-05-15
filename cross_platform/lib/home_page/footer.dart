import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 82, 191, 245),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Serif',
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 180,
                endIndent: 180,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  launch('tel://01224458851');
                },
                child: Text(
                  'Phone: 01224458851',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  launch('mailto:dentalclinic@info.com');
                },
                child: Text(
                  'Email: dentalclinic@info.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Addres: Maadi, Cairo, Egypt',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Copyright © 2024 All Rights Reserved',
                style: TextStyle(
                    fontSize: 15, color: Colors.black, fontFamily: 'serif'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
