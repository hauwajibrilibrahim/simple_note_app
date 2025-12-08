import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/utils/constant.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  const NoteCard({super.key, required this.note, required this.onTap});

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppConstants.getColorFromHex(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              note.title.isEmpty ? 'Untitled' : note.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),

            // Content preview
            Text(
              note.content,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            // Time stamp
            Text(
              _getTimeAgo(note.updatedAt),
              style: const TextStyle(fontSize: 12, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
