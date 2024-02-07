import 'package:abcbul/const.dart';
import 'package:abcbul/services/get_jobs_services/get_jobs_api_call.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateProposalPage extends StatelessWidget {
  const CreateProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: TextButton(
              onPressed: () {
                // JobsService jobService = JobsService();
                JobsService.getAllJobsService(
                    Provider.of<TokenService>(context, listen: false).token!,
                    context);
              },
              child: Text(
                'Get All jobs',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
