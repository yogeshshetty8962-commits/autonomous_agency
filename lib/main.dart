import 'package:flutter/material.dart';

void main() => runApp(AutonomousAgencyApp());

class AutonomousAgencyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autonomous Agency',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String orderStatus = "Waiting for client order...";
  bool isApproved = false;

  void simulateNewOrder() {
    setState(() {
      orderStatus = "New Order: High-Converting Facebook Ads & Video Edit (Budget: 7500 INR)";
      isApproved = false;
    });
  }

  void approveOrder() {
    setState(() {
      isApproved = true;
      orderStatus = "Approved! Assigned to Editor_Alpha. Delivered successfully.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autonomous Creative Agency'),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Company & Owner Profile Card
            Card(
              color: Colors.grey[900],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Company Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                    SizedBox(height: 8),
                    Text('Owner: Yogesh Shetty'),
                    Text('Email: yogeshshetty8962@gmail.com'),
                    Text('Phone: 9663190056'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Live Order Management Card
            Card(
              color: Colors.grey[900],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('AI Robot Order Tracker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                    SizedBox(height: 8),
                    Text(orderStatus, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: simulateNewOrder,
                          icon: Icon(Icons.refresh),
                          label: Text('Simulate Order'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        ),
                        ElevatedButton.icon(
                          onPressed: isApproved ? null : approveOrder,
                          icon: Icon(Icons.check),
                          label: Text('Approve'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Scouted Editors Database
            Text('Auto-Scouted Talent Database', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Editor_Alpha'),
              subtitle: Text('Role: Video Editor | Cost: Low'),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Designer_Beta'),
              subtitle: Text('Role: Graphic Designer | Cost: Low'),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('AdExpert_Gamma'),
              subtitle: Text('Role: Ads Specialist | Cost: Low'),
            ),
          ],
        ),
      ),
    );
  }
}
