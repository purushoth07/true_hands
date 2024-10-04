import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> _imageUrls = [
    'https://thumbs.dreamstime.com/b/vacuum-cleaner-white-carpet-cozy-living-room-interior-rug-vacuuming-concept-home-care-cleanliness-cleaning-311399419.jpg?w=992',
    'https://thumbs.dreamstime.com/b/how-to-grow-phalaenopsis-orchids-home-care-flowering-houseplants-332969313.jpg?w=768',
    'https://thumbs.dreamstime.com/b/happy-female-healthcare-worker-sitting-table-smiling-senior-man-home-health-visit-144592841.jpg?w=768',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: state.themeData.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightBlue, Colors.blue.shade900],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54.withOpacity(0.2),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/profile');
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(text: 'Welcome', color:Colors.white, fontSize: 14),
                commonBoldText(text: 'Rakesh Kumar!', color: Colors.white),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 7),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
              ),
              items: _imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0), // Added border radius
                      ),
                      child: ClipRRect( // Added ClipRRect to clip the image
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 16, 7, 16),
              child: fullIconColorButton(title: 'Emergency Call', textColor: Colors.white, buttonColor: Colors.redAccent, context: context, onPressed: (){})
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonBoldText(text: 'How Was your day?'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMoodIcon([Color(0xFF66BB6A), Color(0xFF1B5E20)], Icons.sentiment_very_satisfied),
                      _buildMoodIcon([Color(0xFF81C784), Color(0xFF2E7D32)], Icons.sentiment_satisfied),
                      _buildMoodIcon([Color(0xFFFFEB3B), Color(0xFFFBC02D)], Icons.sentiment_neutral),
                      _buildMoodIcon([Color(0xFFFFB74D), Color(0xFFE65100)], Icons.sentiment_dissatisfied),
                      _buildMoodIcon([Color(0xFFE57373), Color(0xFFB71C1C)], Icons.sentiment_very_dissatisfied),
                    ],
                  ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: commonBoldText(text: 'Services In progress'),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ServiceItem(date: '1st-Sept-2024');
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: fullIconColorButton(title: 'Request For New Visit?', textColor: Colors.white, buttonColor: Colors.orangeAccent, context: context, onPressed: (){})
              ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: commonBoldText(text: 'Request For Service?'),
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.0, // Adjusted for more square-like cards
                    padding: EdgeInsets.all(16),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      ServiceCard(icon: Icons.medical_services, title: 'Request For Service', color: Colors.blue),
                      ServiceCard(icon: Icons.calendar_today, title: 'Health Care Assistant', color: Colors.blue),
                      ServiceCard(icon: Icons.folder, title: 'Day Care Assistant', color: Colors.orange),
                      ServiceCard(icon: Icons.add, title: 'Other services', color: Colors.pink),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }

  Widget _buildMoodIcon(List<Color> gradientColors, IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

}

class ServiceItem extends StatelessWidget {
  final String date;

  const ServiceItem({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.green),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(text: 'Your have service is in progress.', fontSize: 16),
                SizedBox(height: 4),
                commonText(text: date, color: Colors.blue, fontSize: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Flexible(
              child: commonBoldText(
                text: title,
                textAlign: TextAlign.center,
                fontSize: 12,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
