import 'package:food_app/articelDatabase.dart';

class ArticleAssets {
  int id;
  final String title, image, description, resources;

  ArticleAssets({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.resources,
  });
}

List<ArticleAssets> articlesList = [
  ArticleAssets(
      id: 1,
      title: "الفرق بين البروتين النباتي والبروتين الحيواني",
      image: ArticleImage.article1,
      description: ArticleDescription.article1,
      resources: ArticleResources.article1),
  ArticleAssets(
      id: 2,
      title: "فوائد اوميجا 3",
      image: ArticleImage.article2,
      description: ArticleDescription.article2,
      resources: ArticleResources.article2),
  ArticleAssets(
      id: 3,
      title: "حقائق عن النوم الصحي",
      image: ArticleImage.article3,
      description: ArticleDescription.article3,
      resources: ArticleResources.article3),
  ArticleAssets(
      id: 4,
      title: "كم يحتاج لاعب كمال الأجسام من البروتين يومياً",
      image: ArticleImage.article16,
      description: ArticleDescription.article16,
      resources: ArticleResources.article16),
  ArticleAssets(
      id: 5,
      title: "معلومات لا تعرفها عن النوم",
      image: ArticleImage.article4,
      description: ArticleDescription.article4,
      resources: ArticleResources.article4),
  ArticleAssets(
      id: 6,
      title: "نصائح لنوم صحي",
      image: ArticleImage.article5,
      description: ArticleDescription.article5,
      resources: ArticleResources.article5),
  ArticleAssets(
      id: 7,
      title: "فوائد الاستحمام بالماء البارد",
      image: ArticleImage.article6,
      description: ArticleDescription.article6,
      resources: ArticleResources.article6),
  ArticleAssets(
      id: 8,
      title: "فوائد الاستحمام بالماء الساخن",
      image: ArticleImage.article7,
      description: ArticleDescription.article7,
      resources: ArticleResources.article7),
  ArticleAssets(
      id: 9,
      title: "فوائد الكافيين",
      image: ArticleImage.article8,
      description: ArticleDescription.article8,
      resources: ArticleResources.article8),
  ArticleAssets(
      id: 10,
      title: "الآثار الجانبية لشرب القهوة بكثرة",
      image: ArticleImage.article9,
      description: ArticleDescription.article9,
      resources: ArticleResources.article9),
  ArticleAssets(
      id: 11,
      title: "ما فائدة عضلات البطن",
      image: ArticleImage.article10,
      description: ArticleDescription.article10,
      resources: ArticleResources.article10),
  ArticleAssets(
      id: 12,
      title: "حقن العضلات وما يفعله بالأجسام",
      image: ArticleImage.article11,
      description: ArticleDescription.article11,
      resources: ArticleResources.article11),
  ArticleAssets(
      id: 13,
      title: "زبدة الفول السوداني لكمال الأجسام",
      image: ArticleImage.article12,
      description: ArticleDescription.article12,
      resources: ArticleResources.article12),
  ArticleAssets(
      id: 14,
      title: "فوائد تمرين الضغط",
      image: ArticleImage.article13,
      description: ArticleDescription.article13,
      resources: ArticleResources.article13),
  ArticleAssets(
      id: 15,
      title: "ما هو ضمور العضلات",
      image: ArticleImage.article14,
      description: ArticleDescription.article14,
      resources: ArticleResources.article14),
  ArticleAssets(
      id: 16,
      title: "كيفية إبراز عضلات البطن",
      image: ArticleImage.article15,
      description: ArticleDescription.article15,
      resources: ArticleResources.article15),
  ArticleAssets(
      id: 17,
      title: "الأكل بعد التمرين",
      image: ArticleImage.article17,
      description: ArticleDescription.article17,
      resources: ArticleResources.article17),
  ArticleAssets(
      id: 18,
      title: "الفيتامينات والمعادن",
      image: ArticleImage.article18,
      description: ArticleDescription.article18,
      resources: ArticleResources.article18),
  ArticleAssets(
      id: 19,
      title: "عدد ساعات النوم الموصى بيها وافضل وقت للنوم",
      image: ArticleImage.article19,
      description: ArticleDescription.article19,
      resources: ArticleResources.article19),
  ArticleAssets(
      id: 20,
      title: "أضرار قلة النوم",
      image: ArticleImage.article20,
      description: ArticleDescription.article20,
      resources: ArticleResources.article20),
  ArticleAssets(
      id: 21,
      title: "ما هي الألياف الغذائية",
      image: ArticleImage.article21,
      description: ArticleDescription.article21,
      resources: ArticleResources.article21),
  ArticleAssets(
      id: 22,
      title: "فوائد الكافيين للرياضيين",
      image: ArticleImage.article22,
      description: ArticleDescription.article22,
      resources: ArticleResources.article22),
  ArticleAssets(
      id: 23,
      title: "ما أسباب أوجاع أسفل الظهر",
      image: ArticleImage.article23,
      description: ArticleDescription.article23,
      resources: ArticleResources.article23),
  ArticleAssets(
      id: 24,
      title: "تشنج عضلات الرقبة",
      image: ArticleImage.article24,
      description: ArticleDescription.article24,
      resources: ArticleResources.article24),
  ArticleAssets(
      id: 25,
      title: "التهاب أوتار الكوع",
      image: ArticleImage.article25,
      description: ArticleDescription.article25,
      resources: ArticleResources.article25),
  ArticleAssets(
      id: 26,
      title: "أضرار فول الصويا للرجال",
      image: ArticleImage.article26,
      description: ArticleDescription.article26,
      resources: ArticleResources.article26),
  ArticleAssets(
      id: 27,
      title: "البروتين النباتي",
      image: ArticleImage.article27,
      description: ArticleDescription.article27,
      resources: ArticleResources.article27),
  ArticleAssets(
      id: 28,
      title: "فوائد ممارسة التمارين الرياضية بالكرة المطاطية",
      image: ArticleImage.article28,
      description: ArticleDescription.article28,
      resources: ArticleResources.article28),
  ArticleAssets(
      id: 29,
      title: "أكاذيب شائعة تتعلق بالتمارين الرياضية",
      image: ArticleImage.article29,
      description: ArticleDescription.article29,
      resources: ArticleResources.article29),
  ArticleAssets(
      id: 30,
      title: "أكاذيب تتعلق بكمال الأجسام",
      image: ArticleImage.article30,
      description: ArticleDescription.article30,
      resources: ArticleResources.article30),
];
