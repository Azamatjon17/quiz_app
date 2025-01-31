import 'package:quiz_app/models/quiz_model.dart';

abstract class QuizData {
 static final List<QuizModel> carQuizzes = [
    QuizModel(
      id: 1,
      question: "Dunyodagi eng zo'r moshina brendi?",
      answer: "BMW",
      options: const ['Chevrolet', 'BMW', 'Mers', 'Toyota'],
    ),
    QuizModel(
      id: 2,
      question: "Elektr moshinalar bozorida yetakchi kompaniya?",
      answer: "Tesla",
      options: const ['Nissan', 'Tesla', 'BMW', 'Rivian'],
    ),
    QuizModel(
      id: 3,
      question: "Dastlabki sport avtomobilini ishlab chiqargan kompaniya?",
      answer: "Porsche",
      options: const ['Ferrari', 'Porsche', 'Lamborghini', 'Bugatti'],
    ),
    QuizModel(
      id: 4,
      question: "Lexus qaysi kompaniyaning premium brendi?",
      answer: "Toyota",
      options: const ['Nissan', 'Toyota', 'Mazda', 'Honda'],
    ),
    QuizModel(
      id: 5,
      question: "Dunyodagi eng katta avtomobil ishlab chiqaruvchi kompaniya?",
      answer: "Toyota",
      options: const ['Ford', 'Toyota', 'Volkswagen', 'Hyundai'],
    ),
    QuizModel(
      id: 6,
      question: "Amerika avtomobil ishlab chiqaruvchi brendi?",
      answer: "Ford",
      options: const ['Ford', 'BMW', 'Fiat', 'Mazda'],
    ),
    QuizModel(
      id: 7,
      question: "Mashhur Mustang avtomobilini ishlab chiqaruvchi kompaniya?",
      answer: "Ford",
      options: const ['Chevrolet', 'Ford', 'Dodge', 'Chrysler'],
    ),
    QuizModel(
      id: 8,
      question: "Italiya avtomobil brendlari orasida qaysi biri mashhur?",
      answer: "Ferrari",
      options: const ['Ferrari', 'Volvo', 'Tesla', 'Kia'],
    ),
    QuizModel(
      id: 9,
      question: "Ko'proq yoqilg'i tejamkorligi bilan tanilgan kompaniya?",
      answer: "Honda",
      options: const ['Ford', 'Toyota', 'Honda', 'Nissan'],
    ),
    QuizModel(
      id: 10,
      question: "SUV avtomobillar bozorida yetakchi kompaniya?",
      answer: "Jeep",
      options: const ['Land Rover', 'Jeep', 'Toyota', 'Hyundai'],
    ),
    QuizModel(
      id: 11,
      question: "Dunyodagi eng qimmat avtomobil brendi?",
      answer: "Ferrari",
      options: const ['Lamborghini', 'Ferrari', 'Rolls-Royce', 'Bugatti'],
    ),
    QuizModel(
      id: 12,
      question: "Bugatti kompaniyasi qaysi davlatga tegishli?",
      answer: "Fransiya",
      options: const ['Italiya', 'Fransiya', 'Germaniya', 'Angliya'],
    ),
    QuizModel(
      id: 13,
      question: "Volkswagen qaysi davlat brendi?",
      answer: "Germaniya",
      options: const ['Avstriya', 'Shvetsiya', 'Germaniya', 'Fransiya'],
    ),
    QuizModel(
      id: 14,
      question:
          "Ko'plab avtomobillar uchun komponent ishlab chiqaruvchi kompaniya?",
      answer: "Bosch",
      options: const ['Bosch', 'Magna', 'Valeo', 'ZF Friedrichshafen'],
    ),
    QuizModel(
      id: 15,
      question: "Koreyada mashhur avtomobil ishlab chiqaruvchi kompaniya?",
      answer: "Hyundai",
      options: const ['Toyota', 'Hyundai', 'Kia', 'Daewoo'],
    ),
    QuizModel(
      id: 16,
      question: "Tesla kompaniyasining asoschisi kim?",
      answer: "Elon Musk",
      options: const ['Steve Jobs', 'Bill Gates', 'Elon Musk', 'Jeff Bezos'],
    ),
    QuizModel(
      id: 17,
      question: "Maserati qaysi mamlakatdan keladi?",
      answer: "Italiya",
      options: const ['Italiya', 'Fransiya', 'Germaniya', 'Shvetsiya'],
    ),
    QuizModel(
      id: 18,
      question: "Rolls-Royce qaysi avtomobil segmentida faoliyat yuritadi?",
      answer: "Luks",
      options: const ['Luks', 'Sport', 'SUV', 'Sedan'],
    ),
    QuizModel(
      id: 19,
      question: "Qaysi kompaniya Skyline modelini ishlab chiqargan?",
      answer: "Nissan",
      options: const ['Honda', 'Nissan', 'Mazda', 'Toyota'],
    ),
    QuizModel(
      id: 20,
      question:
          "Lamborghini kompaniyasining logotipida qaysi hayvon tasvirlangan?",
      answer: "Buqa",
      options: const ['Arslon', 'Buqa', 'Burgut', 'Ot'],
    ),
  ];
}
