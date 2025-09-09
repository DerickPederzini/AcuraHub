import 'package:flutter/material.dart';
import 'package:forum_front/components/courses/course_card.dart';
import 'package:forum_front/models/course.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> courses = [
      new Course(
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoqZMxEcWy4D_SZCfajwlaTXehy9yWjveFsw&s",
        title: "Clic",
        theme: "Inovação",
        progress: 100,
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}
