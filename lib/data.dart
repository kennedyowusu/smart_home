class Device {
  final String image;
  final String name;
  bool isEnabled;
  int timerCount;

  Device({
    required this.image,
    required this.name,
    this.isEnabled = false,
    this.timerCount = 0,
  });
}

List<Device> devices = [
  Device(image: 'assets/air-conditioner.png', name: 'AC Control'),
  Device(image: 'assets/desk-lamp.png', name: 'Light Control'),
  Device(image: 'assets/security-camera.png', name: 'Camera Control'),
  Device(image: 'assets/monitor.png', name: 'TV Control'),
];
