part of '../pages/login_page.dart';

class _MobileLayout extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _MobileLayout({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextFormField(),
            const SizedBox(height: 16),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
