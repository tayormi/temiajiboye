import 'package:jaspr/html.dart';

class CourseContents extends StatelessComponent {
  const CourseContents({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      p(
        [
          text('What you will learn'),
        ],
        classes: [
          'subtitle',
          'is-3',
          'pb-4',
          'has-text-weight-bold',
        ],
      ),
      div([
        div([
          ul([
            li([
              text(
                  "🚀 Master the Fundamentals: From setting up your development environment to understanding Dart basics, we'll cover it all"),
            ], classes: [
              'has-text-left'
            ]),
            li([
              text(
                  "🎨 Craft Visually Stunning UIs: Learn to design beautiful, intuitive user interfaces that captivate your users."),
            ]),
            li([
              text(
                  "💡 Leverage Widgets for Functionality: Dive deep into Flutter's widget-based architecture for seamless functionality and interactivity."),
            ]),
            li([
              text(
                  "📱 Build Adaptive Apps: Create apps that feel native on Android and iOS with one codebase."),
            ]),
          ], classes: [
            'bullet-points',
            'has-text-left'
          ]),
        ], classes: [
          'column',
          'is-half',
        ]),
        div([
          ul([
            li([
              text(
                  "🔄 State Management Mastery: Understand and implement efficient state management techniques for smooth app performance"),
            ]),
            li([
              text(
                  "🌐 Network and Database Integration: Integrate with APIs and databases for dynamic, data-driven applications."),
            ]),
            li([
              text(
                  "🧪 Testing and Debugging: Ensure your app is robust and bug-free with comprehensive testing strategies."),
            ]),
            li([
              text(
                  "🚀 Publishing and Deployment: Get your app ready for prime time with tips on deployment and publication."),
            ]),
          ], classes: [
            'bullet-points',
            'has-text-left'
          ]),
        ], classes: [
          'column',
          'is-half'
        ]),
      ], classes: [
        'columns'
      ]),
    ], classes: [
      'container'
    ]);
  }
}
