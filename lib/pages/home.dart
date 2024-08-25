import 'package:jaspr/jaspr.dart';
import 'dart:async';

class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  late DateTime _launchDate;
  String _countdownText = '';
  bool _isLaunched = false;

  @override
  void initState() {
    super.initState();
    _launchDate = DateTime(2024, 08, 28); // Set your launch date here
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = _launchDate.difference(now);

      if (difference.isNegative) {
        setState(() {
          _countdownText = 'Course is now available!';
          _isLaunched = true;
        });
        timer.cancel();
      } else {
        final days = difference.inDays;
        final hours = difference.inHours % 24;
        final minutes = difference.inMinutes % 60;
        final seconds = difference.inSeconds % 60;

        setState(() {
          _countdownText = '${days}d ${hours}h ${minutes}m ${seconds}s';
        });
      }
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'min-h-screen bg-black text-white', [
      // Header
      header(
          classes:
              'fixed top-0 left-0 right-0 z-50 bg-black/50 backdrop-blur-sm border-b border-white/10',
          [
            div(
                classes:
                    'container mx-auto px-4 h-16 flex items-center justify-between',
                [
                  a(
                      classes: 'text-2xl font-bold text-white',
                      href: '#',
                      [text('DartMastery')]),
                  nav(classes: 'hidden md:flex space-x-8', [
                    a(
                        classes:
                            'text-sm text-gray-300 hover:text-white transition-colors',
                        href: '#features',
                        [text('Features')]),
                    a(
                        classes:
                            'text-sm text-gray-300 hover:text-white transition-colors',
                        href: '#curriculum',
                        [text('Curriculum')]),
                    a(
                        classes:
                            'text-sm text-gray-300 hover:text-white transition-colors',
                        href: '#instructor',
                        [text('Instructor')]),
                  ]),
                  a(
                      classes:
                          'px-4 py-2 text-sm font-medium bg-white text-black rounded-full hover:bg-gray-200 transition-colors',
                      href: '#enroll',
                      [text('Start Learning')]),
                ]),
          ]),

      // Hero section
      section(classes: 'pt-32 pb-20', [
        div(classes: 'container mx-auto px-4 text-center', [
          h1(classes: 'text-4xl md:text-6xl font-bold mb-6', [
            text('Master Dart Programming'),
            br(),
            span(
                classes:
                    'bg-gradient-to-r from-blue-400 to-purple-500 bg-clip-text text-transparent',
                [text('From Novice to Pro')]),
          ]),
          p(
              classes:
                  'text-xl md:text-2xl text-gray-400 mb-8 max-w-3xl mx-auto',
              [
                text(
                    'Unlock your potential in modern app development with our comprehensive Dart course.'),
              ]),
          a(
              classes:
                  'px-8 py-3 text-lg font-medium bg-white text-black rounded-full hover:bg-gray-200 transition-colors',
              href: '#enroll',
              [text('Enroll Now')]),
        ]),
      ]),

      // Course Preview section
      section(classes: 'py-20 bg-gray-900', id: 'course-preview', [
        div(classes: 'container mx-auto px-4', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold text-center mb-12',
              [text('Course Preview')]),
          div(
              classes:
                  'flex flex-col lg:flex-row items-center justify-center gap-8',
              [
                div(classes: 'w-full lg:w-3/5', [
                  div(classes: 'aspect-w-16 aspect-h-9', [
                    iframe(
                      [],
                      src: 'https://www.youtube.com/embed/KdCoVfcaaVI',
                      classes: 'w-full h-full rounded-lg shadow-lg',
                      attributes: {
                        'allowfullscreen': 'true',
                        'frameborder': '0',
                      },
                    ),
                  ]),
                ]),
              ]),
        ]),
      ]),

      // Features section
      section(classes: 'py-20', id: 'features', [
        div(classes: 'container mx-auto px-4', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold text-center mb-12',
              [text('Course Features')]),
          div(classes: 'grid md:grid-cols-3 gap-8', [
            _featureCard('Comprehensive Curriculum',
                'From basics to advanced concepts, we\'ve got you covered.'),
            _featureCard('Hands-On Projects',
                'Apply your knowledge with real-world projects.'),
            _featureCard('Expert Instruction',
                'Learn from industry professionals with years of experience.'),
          ]),
        ]),
      ]),

      // What You'll Learn section
      section(classes: 'py-20 bg-gray-900', id: 'what-youll-learn', [
        div(classes: 'container mx-auto px-4', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold text-center mb-12',
              [text('What You\'ll Learn')]),
          div(classes: 'grid md:grid-cols-2 gap-8', [
            _learningItem('Dart Fundamentals',
                'Master the core concepts of Dart programming.'),
            _learningItem('Object-Oriented Programming',
                'Design modular and scalable applications.'),
            _learningItem('Asynchronous Programming',
                'Create responsive apps with Futures and Streams.'),
            _learningItem('Flutter Integration',
                'Apply your Dart skills to build cross-platform mobile apps.'),
          ]),
        ]),
      ]),

      // Course Curriculum section
      section(classes: 'py-20', id: 'curriculum', [
        div(classes: 'container mx-auto px-4', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold text-center mb-12',
              [text('Course Curriculum')]),
          div(classes: 'grid md:grid-cols-2 lg:grid-cols-3 gap-8', [
            _curriculumModule('1. Dart Fundamentals', [
              'Introduction to Dart programming',
              'Setting up the development environment',
              'Variables and data types',
              'Operators and expressions',
              'Control flow statements',
            ]),
            _curriculumModule('2. Functions and Error Handling', [
              'Creating and using functions',
              'Parameters and return values',
              'Anonymous functions and closures',
              'Exception handling',
              'Custom exceptions',
            ]),
            _curriculumModule('3. Object-Oriented Programming', [
              'Classes and objects',
              'Constructors and methods',
              'Inheritance and interfaces',
              'Polymorphism and abstract classes',
              'Encapsulation and access modifiers',
            ]),
            _curriculumModule('4. Collections and Generics', [
              'Lists, Sets, and Maps',
              'Working with iterables',
              'Generic types and collections',
              'Collection methods and operations',
              'Efficient data management',
            ]),
            _curriculumModule('5. Asynchronous Programming', [
              'Introduction to asynchronous programming',
              'Futures and async/await',
              'Error handling in asynchronous code',
              'Streams and stream operations',
            ]),
            _curriculumModule('6. Best Practices and Optimization', [
              'Dart coding conventions',
              'Writing clean and maintainable code',
              'Preparing for Flutter development',
            ]),
          ]),
        ]),
      ]),

      // Instructor section
      section(classes: 'py-20 bg-gray-900', id: 'instructor', [
        div(classes: 'container mx-auto px-4 text-center', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold mb-8',
              [text('Meet Your Instructor')]),
          img(
              src: '/images/temi.png',
              alt: 'Temi Ajiboye',
              classes: 'w-32 h-32 rounded-full mx-auto mb-4'),
          h3(classes: 'text-2xl font-bold mb-2', [text('Temi Ajiboye')]),
          p(
              classes: 'text-gray-400 mb-4',
              [text('Senior Mobile Developer & Technical Lead')]),
          p(classes: 'text-gray-300 max-w-2xl mx-auto', [
            text(
                'With over a decade of experience in Software development, Temi has helped thousands of students become proficient developers.'),
          ]),
        ]),
      ]),

      // Testimonials section
      section(classes: 'py-20', id: 'testimonials', [
        div(classes: 'container mx-auto px-4', [
          h2(
              classes: 'text-3xl md:text-4xl font-bold text-center mb-12',
              [text('Testimonials')]),
          div(
            [],
            classes: 'senja-embed',
            id: 'e42a3b37-feee-44f7-ac5f-dd2a262a23e8',
            attributes: {
              'data-id': 'e42a3b37-feee-44f7-ac5f-dd2a262a23e8',
              'data-mode': 'shadow',
              'data-lazyload': 'false',
              'style': 'display: block;',
            },
          ),
        ]),
      ]),

      // Call-to-action section with countdown or enroll button
      section(
          attributes: {'aria-labelledby': 'cta-heading'},
          classes: 'py-20 bg-gradient-to-r from-blue-600 to-purple-600',
          id: 'enroll',
          [
            div(classes: 'container mx-auto px-4 text-center', [
              if (_isLaunched) ...[
                h2(
                    id: 'cta-heading',
                    classes: 'text-3xl md:text-4xl font-bold mb-6',
                    [text('Enroll Now!')]),
                p(classes: 'text-xl mb-8', [
                  text('Start your journey to becoming a Dart expert today.')
                ]),
                a(
                    classes:
                        'px-8 py-3 text-lg font-medium bg-white text-black rounded-full hover:bg-gray-200 transition-colors',
                    href: '#', // Replace with your enrollment link
                    [text('Enroll in the Course')]),
              ] else ...[
                h2(
                    id: 'cta-heading',
                    classes: 'text-3xl md:text-4xl font-bold mb-6',
                    [text('Coming Soon')]),
                p(
                    classes: 'text-xl mb-4',
                    [text('Get ready to transform your career with Dart!')]),
                p(classes: 'text-lg mb-4', [text('Our course launches in:')]),
                div(classes: 'text-4xl font-bold', [text(_countdownText)]),
                p(classes: 'mt-8 text-sm', [
                  text(
                      'Sign up for our newsletter to get notified when we launch!')
                ]),
              ],
            ]),
          ]),

      // Footer
      footer(classes: 'py-10 bg-gray-900', [
        div(classes: 'container mx-auto px-4 text-center text-gray-400', [
          p([text('© 2023 DartMastery. All rights reserved.')]),
        ]),
      ]),
    ]);
  }

  Component _featureCard(String title, String description) {
    return div(classes: 'bg-gray-800 p-6 rounded-lg', [
      h3(classes: 'text-xl font-bold mb-2', [text(title)]),
      p(classes: 'text-gray-400', [text(description)]),
    ]);
  }

  Component _learningItem(String title, String description) {
    return div(classes: 'flex items-start', [
      div(classes: 'flex-shrink-0 mt-1 mr-4', [
        span([], classes: 'w-4 h-4 bg-blue-500 rounded-full block'),
      ]),
      div([
        h3(classes: 'text-lg font-bold mb-1', [text(title)]),
        p(classes: 'text-gray-400', [text(description)]),
      ]),
    ]);
  }

  Component _curriculumModule(String title, List<String> topics) {
    return div(classes: 'bg-gray-800 p-6 rounded-lg', [
      h3(classes: 'text-xl font-bold mb-4', [text(title)]),
      ul(classes: 'space-y-2', [
        for (var topic in topics)
          li(classes: 'flex items-start', [
            svg(classes: 'w-5 h-5 mr-2 text-blue-500 mt-1', attributes: {
              'viewBox': '0 0 20 20',
              'fill': 'currentColor'
            }, [
              path([], attributes: {
                'fill-rule': 'evenodd',
                'd':
                    'M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z',
                'clip-rule': 'evenodd'
              }),
            ]),
            span(classes: 'text-gray-300', [text(topic)]),
          ]),
      ]),
    ]);
  }
}
