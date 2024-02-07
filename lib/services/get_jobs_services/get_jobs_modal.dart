class Job {
  final dynamic id;
  final dynamic title;
  final dynamic description;
  final dynamic userId;
  final dynamic workerId;
  final dynamic amount;
  final dynamic city;
  final dynamic cover;
  final dynamic category;
  final dynamic expiresAt;
  final dynamic status;
  final dynamic createdAt;
  final dynamic? deletedAt; // It seems this can be nullable

  final User user;
  final List<Proposal> proposals;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.workerId,
    required this.amount,
    required this.city,
    required this.cover,
    required this.category,
    required this.expiresAt,
    required this.status,
    required this.createdAt,
    required this.deletedAt,
    required this.user,
    required this.proposals,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      userId: json['user_id'] ?? 0,
      workerId: json['worker_id'] ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      city: json['city'] ?? '',
      cover: json['cover'] ?? '',
      category: json['category'] ?? '',
      expiresAt: json['expires_at'] ?? 0,
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      user: User.fromJson(json['user'] ?? {}),
      proposals: (json['proposals'] as List<dynamic>?)
              ?.map((proposal) => Proposal.fromJson(proposal))
              .toList() ??
          [],
    );
  }
}

class User {
  final dynamic id;
  final dynamic name;
  final dynamic email;
  final dynamic contact;
  final dynamic city;
  final dynamic image;
  final dynamic subscriptionEndDate;
  final dynamic idNumber;
  final dynamic status;
  final dynamic stars;
  final dynamic projectCompleted;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.city,
    required this.image,
    required this.subscriptionEndDate,
    required this.idNumber,
    required this.status,
    required this.stars,
    required this.projectCompleted,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contact: json['contact'] ?? '',
      city: json['city'] ?? '',
      image: json['image'] ?? '',
      subscriptionEndDate: json['subscription_end_date'] ?? '',
      idNumber: json['id_number'] ?? '',
      status: json['status'] ?? '',
      stars: json['stars'] ?? '',
      projectCompleted: json['project_completed'] ?? '',
    );
  }
}

class Proposal {
  final dynamic id;
  final dynamic description;
  final dynamic bidAmount;
  final dynamic estimatedTime;
  final dynamic days;
  final dynamic userId;
  final dynamic jobId;
  final dynamic status;
  final dynamic createdAt;

  Proposal({
    required this.id,
    required this.description,
    required this.bidAmount,
    required this.estimatedTime,
    required this.days,
    required this.userId,
    required this.jobId,
    required this.status,
    required this.createdAt,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      id: json['id'],
      description: json['description'],
      bidAmount: json['bid_amount'],
      estimatedTime: json['estimated_time'],
      days: json['days'],
      userId: json['user_id'],
      jobId: json['job_id'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}
