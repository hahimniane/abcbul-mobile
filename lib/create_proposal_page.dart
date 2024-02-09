import 'package:abcbul/const.dart';
import 'package:abcbul/services/Bid_job/bid_job_apil_call.dart';
import 'package:abcbul/services/get_jobs_services/get_jobs_api_call.dart';
import 'package:abcbul/services/provider_get_user_token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateProposalPage extends StatelessWidget {
  final jobId;
  const CreateProposalPage({super.key, required this.jobId});

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
                JobBid.bidForAJob(
                    jobId, 'I am the description', "8", '200', context);
                // // JobsService jobService = JobsService();
                // JobsService.getAllJobsService(
                //     Provider.of<TokenService>(context, listen: false).token!,
                //     context);
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
