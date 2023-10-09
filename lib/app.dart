import 'package:jaspr/html.dart';
import 'package:temiajiboye/layout/course_contents.dart';

class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      div([
        div([
          div([
            span([
              text('40+ hours of content')
            ], classes: [
              'tag',
              'is-link',
              'is-normal',
            ]),
            p([
              text('The Complete Flutter App Development Course')
            ], classes: [
              'title',
              'is-1',
              'is-size-1-mobile',
              'has-text-weight-bold',
              'pb-4',
            ]),
            p([
              text('From zero to Flutter hero')
            ], classes: [
              'subtitle',
              'is-4',
              'pb-6',
            ]),
            p([
              text(
                  'Are you ready to dive into the world of mobile app development and create stunning, high-performance applications? Look no further! Welcome to "The Complete Flutter App Development Course" — your gateway to becoming a proficient Flutter developer.')
            ], classes: [
              'subtitle',
              'is-5',
              'has-text-grey',
              'pb-6'
            ]),
            div([
              img(src: '/assets/course.png', classes: []),
            ], classes: [
              'box',
            ]),
          ], classes: [
            'column',
            'is-6',
            'is-offset-3'
          ]),
          div([
            p([
              text('What people are saying about the Tutor')
            ], classes: [
              'subtitle',
              'is-3',
              'pb-4',
              'has-text-weight-bold',
            ]),
          ], classes: [
            'senja-embed',
            'pt-6'
          ], attributes: {
            'data-id': 'f70a263f-84fb-44cb-956d-281854d41688',
            'data-lazyload': 'false'
          }),
          CourseContents()
        ], classes: [
          'container',
          'has-text-centered'
        ]),
      ], classes: [
        'hero-body'
      ]),
    ], classes: [
      'hero is-info',
      'is-fullheight'
    ]);
  }
}
