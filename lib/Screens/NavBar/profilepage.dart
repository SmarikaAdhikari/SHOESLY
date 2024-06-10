import 'package:flutter/material.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Screens/loginpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.product});
  final Product product;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page', style: Apptheme.titlebar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              profilecard(),
              const Divider(
                thickness: 0.5,
              ),
              infomethod(context),
            ],
          ),
        ));
  }

  Column profilecard() {
    return Column(children: [
      const SizedBox(height: 20),
      const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/icons/person.png'),
      ),
      const SizedBox(height: 20),
      const Text("Smarika",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const Text("smarikadh@gmail.com",
          style: TextStyle(
            fontSize: 18,
          )),
           const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          color: maingrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
            onPressed: () {},
            child: const Text('Edit Profile',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: white))),
      ),
      const SizedBox(height: 20),
    ]);
  }

  Container infomethod(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Infocard(title: 'My Profile', icon: Icons.person),
              const Divider(
                thickness: 0.5,
              ),
              const Infocard(title: 'Notifications', icon: Icons.notifications),
              const Divider(
                thickness: 0.5,
              ),
              const Infocard(title: 'Services', icon: Icons.design_services),
              const Divider(
                thickness: 0.5,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(product: widget.product)),
                    );
                  },
                  child: const Infocard(
                      title: 'Logout', icon: Icons.logout_outlined)),
            ],
          ),
        ));
  }
}

class Infocard extends StatelessWidget {
  const Infocard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: maingrey,
            size: 25,
          ),
          const SizedBox(width: 20),
          Text(title, style: Ordertheme.text),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: maingrey,
            size: 16,
          )
        ],
      ),
    );
  }
}
