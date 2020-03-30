import 'package:essentials/models/service.dart';
import 'package:essentials/models/service_provider.dart';

class Utilities {
  static const GROCERIES = 'groceries';
  static const WATER = 'water';
  static const HYGIENE = 'hygiene';
  static const MEDICINE = 'medicine';

  static const LITRE = 'l';
  static const KILOGRAMS = 'kg';
  static const MILI_LITRE = 'ml';
  static const UNIT = 'item';

  static const AREAS = [
    'baner',
    'pashan',
    'kothrud',
    'hinjewadi',
  ];
  static const CITIES = [
    'pune',
  ];
  static const STATES = [
    'maharashtra',
  ];

  static final List<Service> groceriesServices = [
    Service(
      name: 'Potato',
      quantity: 1,
      unit: KILOGRAMS,
      price: 20.0,
      maxOrderLimit: 5,
      outOfStock: false,
    ),
    Service(
      name: 'Rice',
      quantity: 1,
      unit: KILOGRAMS,
      price: 30.0,
      maxOrderLimit: 5,
      outOfStock: true,
    ),
    Service(
      name: 'Milk',
      quantity: 500,
      unit: MILI_LITRE,
      price: 36.0,
      maxOrderLimit: 8,
      outOfStock: false,
    ),
  ];

  static final List<ServiceProvider> groceriesProvider = [
    ServiceProvider(
      name: 'Uttam Kirana',
      email: 'uttam@gmail.com',
      phone: '1234567890',
      password: 'uttam',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[0],
      typeOfService: GROCERIES,
      services: groceriesServices.sublist(1),
    ),
    ServiceProvider(
      name: 'Janta Market',
      email: 'janta@gmail.com',
      phone: '9876543210',
      password: 'janta',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[1],
      typeOfService: GROCERIES,
      services: groceriesServices.sublist(0, 1),
    ),
    ServiceProvider(
      name: 'Desi Dairy',
      email: 'desi@gmail.com',
      phone: '5647832910',
      password: 'uttam',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[2],
      typeOfService: GROCERIES,
      services: groceriesServices.sublist(2),
    ),
  ];

  static final List<Service> waterServices = [
    Service(
      name: 'Water',
      quantity: 1,
      unit: LITRE,
      price: 20.0,
      maxOrderLimit: 50,
      outOfStock: false,
    ),
  ];

  static final List<ServiceProvider> waterProvider = [
    ServiceProvider(
      name: 'Godrej water suppliers',
      email: 'godrej@gmail.com',
      phone: '1234567890',
      password: 'godrej',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[0],
      typeOfService: WATER,
      services: waterServices,
    ),
  ];

  static final List<Service> hygieneServices = [
    Service(
      name: 'Santizer',
      quantity: 100,
      unit: MILI_LITRE,
      price: 100.0,
      maxOrderLimit: 5,
      outOfStock: false,
    ),
    Service(
      name: 'Toilet Paper (pack of 6)',
      quantity: 1,
      unit: UNIT,
      price: 50.0,
      maxOrderLimit: 10,
      outOfStock: true,
    ),
    Service(
      name: 'Hand Wash',
      quantity: 500,
      unit: MILI_LITRE,
      price: 200.0,
      maxOrderLimit: 8,
      outOfStock: false,
    ),
  ];

  static final List<ServiceProvider> hygieneProvider = [
    ServiceProvider(
      name: 'Uttam Retail store',
      email: 'uttam@gmail.com',
      phone: '1234567890',
      password: 'uttam',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[0],
      typeOfService: HYGIENE,
      services: hygieneServices,
    ),
    ServiceProvider(
      name: 'Janta Retail store',
      email: 'janta@gmail.com',
      phone: '9876543210',
      password: 'janta',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[1],
      typeOfService: HYGIENE,
      services: hygieneServices.sublist(0, 1),
    ),
    ServiceProvider(
      name: 'Body shop',
      email: 'body@gmail.com',
      phone: '5647832910',
      password: 'body',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[2],
      typeOfService: HYGIENE,
      services: hygieneServices.sublist(2),
    ),
  ];

  static final List<Service> medicineServices = [
    Service(
      name: 'Paracetamol (pack of 10)',
      quantity: 1,
      unit: UNIT,
      price: 100.0,
      maxOrderLimit: 5,
      outOfStock: false,
    ),
    Service(
      name: 'Crocin (pack of 5)',
      quantity: 1,
      unit: UNIT,
      price: 75.0,
      maxOrderLimit: 10,
      outOfStock: true,
    ),
  ];

  static final List<ServiceProvider> medicineProvider = [
    ServiceProvider(
      name: 'Uttam Medico',
      email: 'uttam@gmail.com',
      phone: '1234567890',
      password: 'uttam',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[0],
      typeOfService: MEDICINE,
      services: medicineServices,
    ),
    ServiceProvider(
      name: 'National Medico',
      email: 'national@gmail.com',
      phone: '9876543210',
      password: 'national',
      state: STATES[0],
      city: CITIES[0],
      area: AREAS[1],
      typeOfService: MEDICINE,
      services: medicineServices.sublist(1),
    ),
  ];

  static List<ServiceProvider> getServiceProviders(String typeOfService) {
    if (typeOfService == GROCERIES)
      return groceriesProvider;
    else if (typeOfService == WATER)
      return waterProvider;
    else if (typeOfService == HYGIENE) return hygieneProvider;
    return medicineProvider;
  }
}
