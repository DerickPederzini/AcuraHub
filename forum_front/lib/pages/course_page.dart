import 'package:flutter/material.dart';
import 'package:forum_front/components/courses/course_card.dart';
import 'package:forum_front/services/etapaService.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: fetchCourseByUserId(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              Text("Erro: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final coursesYes = snapshot.data!;
              return ListView.separated(
                itemCount: coursesYes.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: coursesYes[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 32,);
                },
              );
            }
            return Text("sucks");
          },
        ),
      ),
    );
  }
}
