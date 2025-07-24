import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/contact/contact_form_bloc.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ContactFormBloc>();

    return BlocBuilder<ContactFormBloc, ContactFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Your Name'),
              onChanged: (value) => bloc.add(NameChanged(value)),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 4,
              onChanged: (value) => bloc.add(MessageChanged(value)),
            ),
            const SizedBox(height: 8),
            if (state.error.isNotEmpty)
              Text(state.error, style: const TextStyle(color: Colors.red)),
            if (state.success)
              const Text("Message sent!",
                  style: TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => bloc.add(SubmitForm()),
              child: const Text("Send"),
            )
          ],
        );
      },
    );
  }
}
