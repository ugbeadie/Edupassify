// import 'package:flutter/material.dart';
// import 'package:coffee_card/utils/app_colors.dart';
// import 'widgets/stat_card.dart';
// import 'widgets/subject_carousel.dart';
// import 'all_subjects_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   void _goToAllSubjects(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const AllSubjectsScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundGray,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔵 Header Section
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
//               decoration: const BoxDecoration(color: AppColors.primaryBlue),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Hello,",
//                     style: TextStyle(color: Colors.white70, fontSize: 20),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     "John Doe 👋",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // 🔍 Search Bar
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withValues(alpha: 0.15),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: const TextField(
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: "Search subjects, exams...",
//                         hintStyle: TextStyle(color: Colors.white70),
//                         border: InputBorder.none,
//                         icon: Icon(Icons.search, color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 🟦 Stats Grid
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: const [
//                   StatCard(
//                     icon: Icons.description_outlined,
//                     value: "24",
//                     label: "Exams Taken",
//                   ),
//                   StatCard(
//                     icon: Icons.star_border,
//                     value: "87%",
//                     label: "Avg Score",
//                   ),
//                   StatCard(
//                     icon: Icons.book_outlined,
//                     value: "12",
//                     label: "Subjects",
//                   ),
//                   StatCard(
//                     icon: Icons.track_changes_outlined,
//                     value: "5",
//                     label: "Roadmaps",
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // 🧭 Subjects Carousel Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "My Subjects",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   GestureDetector(
//                     onTap: () => _goToAllSubjects(context),
//                     child: const Text(
//                       "See All",
//                       style: TextStyle(
//                         color: AppColors.primaryBlue,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             const SubjectCarousel(), // ← horizontal scroll subjects
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:coffee_card/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  /// Fetch the latest user data (ensures displayName updates after sign-up)
  Future<void> _loadUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      setState(() {
        user = FirebaseAuth.instance.currentUser;
        loading = false;
      });
    } catch (e) {
      debugPrint('Error loading user: $e');
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await authService.value.signOut();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${user?.displayName ?? 'User'}!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            // ElevatedButton.icon(
            //   onPressed: _loadUser,
            //   icon: const Icon(Icons.refresh),
            //   label: const Text('Refresh Profile'),
            // ),
          ],
        ),
      ),
    );
  }
}
