import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truehands/bloc/theme/theme_bloc.dart';
import 'package:truehands/presentation/widgets/main_widgets.dart';

class FundList extends StatelessWidget {
  const FundList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: commonBoldText(text: 'Funds', color: Colors.white),
            backgroundColor: state.themeData.primaryColor,
            elevation: 1,
          ),
          body: ListView.separated(
            itemCount: 8,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            itemBuilder: (context, index) {
              return _buildListItem(_getItemTitle(index));
            },
          ),
        );
      },
    );
  }

  Widget _buildListItem(String title) {
    return ListTile(
      title: commonBoldText(
        text: title,
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Handle item tap
        print('Tapped on $title');
      },
    );
  }

  String _getItemTitle(int index) {
    switch (index) {
      case 0: return 'Main Wallet';
      case 1: return 'Emergency Wallet';
      case 2: return 'Add Funds';
      case 3: return 'Visits';
      case 4: return 'Add Visits';
      case 5: return 'Transactions';
      case 6: return 'Attachments';
      case 7: return 'Download Statement';
      default: return '';
    }
  }
}