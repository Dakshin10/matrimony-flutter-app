import 'package:bright_weddings/Component/AppBar/header.dart';
import 'package:bright_weddings/View/Dashboard/chat.dart';
import 'package:bright_weddings/View/Profile/ProfileDetails/profile_details.dart';
import 'package:bright_weddings/Component/Dashboard/profile_list/profile_list_tab.dart';
import 'package:bright_weddings/Controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/Dashboard/New Profile/new_profile_tab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bright_weddings/View/Discover/discover_page.dart';

class DashboardMob extends StatefulWidget {
  DashboardMob({super.key});

  @override
  _DashboardMobState createState() => _DashboardMobState();
}

class _DashboardMobState extends State<DashboardMob> {
  final ScreenController controller = Get.find<ScreenController>();
  int _currentIndex = 0;
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewAllButton() {
    return TextButton(
      onPressed: () {},
      child: Text('Viewall'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Find your perfect',
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              'Match!',
              style: GoogleFonts.kodchasan(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for partner',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  // 👈 add this line
                  color: Colors.black, // black border color
                  width: 0.1, // border thickness
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Welcome!\nJoin your nearest Community.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Join"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(232, 227, 241, 255),
                      foregroundColor: Colors.black,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle(
                    'New Profiles'), // Use the custom function here
                _viewAllButton(),
              ],
            ),
            NewProfileTab(bodyContext: context),
            SizedBox(height: 3.0),
            SizedBox(height: 20),

            // RECOMMENDATIONS LABEL
            Text(
              "Recommendations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: ProfileListTab(),
              ),
            ),
            SizedBox(height: 3.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Track the selected index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Use Get.to() for navigation
          switch (index) {
            case 0: // Home
              // Already on home, no need to navigate
              break;
            case 1: // Matches
              Get.to(() => DiscoverPage()); // 👈 Add this
              break;
            case 2: // Messages
              Get.to(() => Chat());
              break;
            case 3: // Profile
              Get.to(() => ProfileDetails());
              break;
            case 4: // Discover
              Get.to(() => DiscoverPage());
              break;
          }
        },
        selectedItemColor:
            Colors.redAccent, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        type: BottomNavigationBarType.fixed, // This allows more than 3 items
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined), // New button
            label: 'Messages',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
        ],
      ),
    );
  }
}

Widget _buildCategory(IconData icon, String title) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 46, color: Colors.deepPurple.shade300),
          SizedBox(height: 9),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    ),
  );
}
