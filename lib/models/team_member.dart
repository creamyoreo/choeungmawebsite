class TeamMember {
  const TeamMember({required this.name, required this.role});

  final String name;
  final String role;

  static const String pendingDescription = 'To be edited.';
  static const String pendingContact = 'To be edited.';
}

const List<TeamMember> teamMembers = [
  TeamMember(name: 'Doungke', role: 'Founder'),
  TeamMember(name: 'Karuna', role: 'Team Member'),
  TeamMember(name: 'Hanfa', role: 'Team Member'),
  TeamMember(name: 'Person 4', role: 'Team Member'),
  TeamMember(name: 'Jasmine', role: 'Team Member'),
  TeamMember(name: 'Cleo', role: 'Team Member'),
];
