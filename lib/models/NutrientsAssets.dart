import 'package:flutter/material.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/models/nutrient_categories_lists.dart';

class NutrientsAssets {
  int id;
  final String title, image, description, sources;
  final Color nutrientColor;
  final List nutrientFood;

  NutrientsAssets(
      {required this.id,
      required this.title,
      required this.image,
      required this.description,
      required this.nutrientColor,
      required this.sources,
      required this.nutrientFood});
}

List<NutrientsAssets> nutrientsList = [
  NutrientsAssets(
      id: 1,
      title: "الكربوهيدرات",
      image: "assets/images/nutrients/carb.png",
      description: '''
الكربوهيدرات هي مصدر الوقود الأساسي للجسم، وأثناء عملية الهضم تتحول الى سكريات بسيطة، وبعد ذلك يتم امتصاصها في مجرى الدم، وتعرف حينها باسم سكر الدم (الجلوكوز).\n
وعند هذه المرحلة، يدخل الجلوكوز إلى الجسم بمساعدة الأنسولين، ويستمد الجسم الطاقة من الجلوكوز.\n
 فالجلوكوز هو مصدر الطاقة اللازمة للأنشطة؛ سواءً أكانت الهرولة أو التمرين حتى مجرد التنفس والتفكير، و يتم تخزين الفائض من الجلوكوز على شكل جلايكوجين في الكبد والعضلات.\n
و الجلايكوجين هو مصدر سريع للحصول على الطاقة عندما تنقص كمية جلوكوز الدم فإن مخزون الكبد من الجلايكوجين يستخدم لتعويض النقص.\n
الخلاصة: تتحول الكربوهيدرات الى جلوكوز وهو المصدر الأساسي للطاقة في الجسم بعد اخذ الجسم حاجته من الجلوكوز للقيام بالانشطة والحركة والتمرين يتم تخزين المتبقي منه على شكل جلايكوجين في كبد والعضلات – وهو مخزون للطاقة - ،اذا كان هناك مقدار زائد من الجلوكوز بعد ذلك يتم تحويله إلى دهون.''',
      nutrientColor: Color(0xFFf5c182),
      sources:
          '1- Yvette Brazier (17/12/2020), "What you need to know about carbs", medicalnewstoday, Retrieved 30/3/2021. Edited.\n2- Darla Leal (31/12/2020), "Why Carbohydrates Need to Stay in Our Diet", verywellfit, Retrieved 27/2/2021. Edited.\n3- ^ أ ب ت "Nutrition for sport and exercise", nutrition.org, Retrieved 28/2/2021. Edited.\n4- Elizabeth Quinn (25/7/2019), "Why Carbohydrates Are Important for Exercise", verywellfit, Retrieved 28/2/2021. Edited.\n5- Susan Bernstein (30/10/2020), "Foods That Help You Build Muscle", webmd, Retrieved 28/2/2021. Edited.\n6- Kathleen Zelman, "7 Muscle Foods for Men", webmd, Retrieved 28/2/2021. Edited.\n7- Ana Sandoiu (19/2/2017), "Carbs help the body recover after intense workout", medicalnewstoday, Retrieved 28/2/2021. Edited.\n8- " CARBOHYDRATES THE MASTER FUEL", usada, Retrieved 28/2/2021. Edited.\n9- Jon Johnson (3/9/2018), "What to eat before a workout to lose weight and build muscle", medicalnewstoday, Retrieved 28/2/2021. Edited.\n10- Arlene Semeco (20/9/2016), "Post-Workout Nutrition: What to Eat After a Workout", healthline, Retrieved 28/2/2021. Edited.\n11- Darla Leal (24/7/2020), "An Overview of Sports Nutrition", verywellfit, Retrieved 28/2/2021. Edited.\n',
      nutrientFood: carbFoodList),
  NutrientsAssets(
      id: 2,
      title: "الدهون الصحية",
      image: "assets/images/nutrients/fat.png",
      description: '''
تُعرف الدهون الأحادية غير المشبعة والدهون المتعددة غير المشبعة باسم "الدهون الصحية"، تعتبر صحية لأنها يمكن أن تساعد في تقليل الكوليسترول الضار (LDL) ، وزيادة الكوليسترول الجيد (HDL). ويقلل أيضًا من مخاطر الإصابة بأمراض القلب والأوعية الدموية.\n
أهمية تناول الدهون الصحية:
- استهلاك الدهون الصحية مهم جدا لأنه يساعد في تشكيل الـ HDL وهو الكوليستيرول النافع بالجسم وأهميته الحفاظ على الشرايين بمساعدة الجسم على التخلص من الدهون الزائدة بالأوعية الدموية، عن طريق التخلص منها من خلال الكبد.\n
- تساعد الدهون الصحية على امتصاص فيتامين A, D, E, K وبالتالي تجنب نقصانها في الجسم مما قد يؤدي إلى مشاكل صحية.\n
- تناول كميات كافية من الدهون الصحية مهم جدا للحفاظ على صحة المخ والجهاز العصبي، بما في ذلك المساعدة على تحسين الحالة المزاجية.\n
- تنظيم الهرمونات والجينات, حيث تنظم الدهون إنتاج هرمونات الإنجاب والستيرويد، وكذلك الجينات المساهمة في النمو والتمثيل الغذائي.\n
- تساعد على الأحساس بالشبع لفترة أطول.''',
      nutrientColor: Color(0xFF909b8c),
      sources:
          '1- Darla Leal (28/7/2020), "Nutrition for Your Muscle Growth", verywellfit, Retrieved 20/2/2022. Edited.\n2- Gord Kerr (12/3/2020), "How Fat Helps Build Muscle, and the Best and Worst Fats to Eat", livestrong, Retrieved 17/2/2022. Edited.\n3- ^ أ ب ت ث Gord Kerr (12/3/2020), "How Fat Helps Build Muscle, and the Best and Worst Fats to Eat", livestrong, Retrieved 17/2/2022. Edited.\n4- Jayne Leonard (28/7/2018), "What are the most healthful high-fat foods?", medicalnewstoday, Retrieved 20/2/2022. Edited.\n5- Tyler Read (12/4/2021), "How to Gain Muscle, No Matter Who You Are", healthline, Retrieved 20/2/2022. Edited.\n6- Paul Rogers (13/4/2020), "Top 15 Tips for Building Muscle", verywellfit, Retrieved 20/2/2022. Edited.\n7- "What are fats?", www.webmd.com, Retrieved 29-10-2019. Edited.\n8- ↑ Judy Mouland, "The 5 Surprising Benefits of Eating More Fat"، www.lifehack.org, Retrieved 3-11-2019. Edited.\n9- "Dietary fats: Know which types to choose", www.mayoclinic.org, Retrieved 15-8-2019. Edited.\n10- "Dietary fats: Know which types to choose", www.mayoclinic.org, Retrieved 15-8-2019. Edited.\n',
      nutrientFood: fatFoodList),
  NutrientsAssets(
      id: 3,
      title: "البروتين",
      image: "assets/images/nutrients/protein.png",
      description: '''
تعد البروتينات اللبنات الأساسية لبناء العضلات، ولذلك فإن تناول كميات كافية منها يساهم في الحفاظ على كتلة العضلات وتعزيز نموها عند ممارسة تمارين القوة، ويجب على الرياضيين، أو الذين يمارسون رياضة رفع الأثقال، أو الأشخاص الذين يحاولون زيادة العضلات التأكد من الحصول على كميات كافية من البروتين.\n
إلى جانب فوائد البروتين في نمو العضلات؛ فإنها تساعد أيضاً على إصلاح العضلات والأنسجة التالفة، وتجدر الإشارة هنا إلى أن أغلب الرياضيين يمكنهم الحصول على احتياجاتهم من البروتين عن طريق تناول الأطعمة الغنية بالبروتين دون الحاجة إلى استخدام المكملات الغذائية، ويمكن استخدام مساحيق البروتين في حال عدم وجود وقت لتناول عدد وجبات كافية لتلبية احتياجه اليومي من البروتين ،وفي بعض الظروف المحددة للغاية، إلا أن ذلك لا يغني عن تناول الأطعمة الكاملة للحصول على جميع العناصر الغذائية التي يحتاجها الجسم.''',
      nutrientColor: Color(0xFFaa705c),
      sources:
          '1- "PROTEIN INTAKE FOR OPTIMAL MUSCLE MAINTENANCE", www.acsm.org, Retrieved 24-10-2020. Edited.\n2- "Bodybuilding and sports supplements: the facts", www.nhs.uk,2-8-2018، Retrieved 24-10-2020. Edited.\n3- "protein", www.betterhealth.vic.gov.au, Retrieved 24-10-2020. Edited.\n4- Kris Gunnars (8-3-2019), "10 Science-Backed Reasons to Eat More Protein"، www.healthline.com, Retrieved 24-10-2020. Edited.\n5- John Bosse, Brian Dixon (2012), "Dietary protein to maximize resistance training: a review and examination of protein spread and change theories", Journal of the International Society of Sports Nutrition, Issue 1, Folder 9, Page 42. Edited.\n6- Jayne Leonard (18-9-2018), "What are the benefits of protein powder?"، www.medicalnewstoday.com, Retrieved 24-10-2020. Edited. \n7- Jooyoung Kim, Chulhyun Lee, And Joohyung Lee (2017), "Effect of timing of whey protein supplement on muscle damage markers after eccentric exercise", Journal of exercise rehabilitation, Issue 4, Folder 13, Page 436-440. Edited.\n8- Darla Leal (24-7-2020), "An Overview of Sports Nutrition"، www.verywellfit.com, Retrieved 24-10-2020. Edited.\n9- Moira Lawler (6-12-2019), "What Is Protein? How Much You Need, Benefits, Sources, More"، www.everydayhealth.com, Retrieved 19-7-2020. Edited.\n10- Atli Arnarson (31-10-2017), "8 Signs and Symptoms of Protein Deficiency"، www.healthline.com, Retrieved 19-7-2020. Edited.\n11- Darla Leal (31-7-2020), "The Effects of Protein Deficiency"، www.verywellfit.com, Retrieved 19-7-2020. Edited.\n',
      nutrientFood: proteinFoodList),
  NutrientsAssets(
      id: 4,
      title: "الصوديوم",
      image: "assets/images/nutrients/sodium .png",
      description: '''
تكمن أهمية الصوديوم في الآتي:
1- ضبط معدلات السوائل في الجسم: يعتبر الصوديوم واحدًا من المعادن التي تعمل على ضبط معدلات السوائل في الجسم، أي أن هناك ارتباط كبير بين توازن المياه والصوديوم، حيث يعد الصوديوم بمثابة قناة لضخ المياه في الخلايا.\n
2- الوقاية من ضربة الشمس: تحدث ضربة الشمس نتيجة فشل القلب في تنظيم العملية الحيوية بالجسم نتيجة التعرض لدرجة حرارة عالية للغاية، في حين يساعد تناول كوب من الماء بالملح على الوقاية من ضربات الشمس، فيلعب الصوديوم دورًا في تعويض الإلكتروليت المهمة المفقودة في هذا الوقت.\n
3- تحسين وظيفة المخ: يعد المخ شديد الحساسية لأي تغيير في معدلات الصوديوم بالجسم، ومن ثم فإن نقصه يسبب التشوش وعدم الانتباه، ويؤدي تناول كمية مناسبة منه إلى تحسين وظائف المخ وتطوره وقدرته على العمل بشكل سليم.\n
4- تخفيف تشنج العضلات: تزيد فرص الإصابة بالجفاف خلال أشهر الصيف الحار، وبالتالي يجب الحصول على العصائر والمشروبات الغنية بالصوديوم لتخزين عدد وفير من الإلكتروليت.\n
5- ضبط ضغط الدم: يعمل الصوديوم على ضبط انقباضات القلب، ويلعب دورًا مهمًا في التحكم بضغط الدم بالجسم، إلا أن زيادة كمية الصوديوم بشكل مفرط تسبب مضاعفات صحية خطيرة.''',
      nutrientColor: Color(0xFFe5d7d6),
      sources:
          '1- "11 Impressive Benefits of Sodium", www.organicfacts.net, Retrieved 12/1/2021.\n2- "Hyponatremia", www.mayoclinic.org, Retrieved 11/1/2021. Edited.\n3- "Sodium bicarbonate infusion for prevention of acute kidney injury", link.springer.com, Retrieved 12/1/2021. Edited.\n4- "Sodium (Na) in Blood", www.uofmhealth.org, Retrieved 12/1/2021. Edited.\n5- "What Is Sodium Hyaluronate and How Is It Used in Skin Care?", www.healthline.com, Retrieved 12/1/2021. Edited.\n6- "Sodium-glucose transport: role in diabetes mellitus and potential clinical implications", www.ncbi.nlm.nih.gov, Retrieved 12/1/2021. Edited.\n7- "Why Is Too Much Salt Bad for You?", www.livescience.com, Retrieved 12/1/2021. Edited.\n',
      nutrientFood: sodiumFoodList),
  NutrientsAssets(
      id: 5,
      title: "البوتاسيوم",
      image: "assets/images/nutrients/potassium.png",
      description: '''
البوتاسيوم هو معدن يحتاجه جسم الإنسان ليعمل بشكل صحيح، فهو يساهم في وظائف الأعصاب، ويساعد على انقباض العضلات، كما أنه يلعب دوراً في نقل العناصر الغذائية إلى الخلايا، وإخراج الفضلات منها، بالإضافة إلى أنه يساهم في المحافظة على انتظام ضربات القلب.\n
ومن الجدير بالذكر أن الجسم لا يستطيع إنتاج البوتاسيوم بنفسه، ولذلك فإن من المهم تناول كميات كافية ومتوازنة من مصادره، إذ إن استهلاك كميات قليلة جداً من البوتاسيوم قد يؤدي إلى حدوث مشاكل خطيرة على الصحة، في حين ان الإفراط في استخدامه قد يسبب حدوث مشاكل صحية أيضاً.''',
      nutrientColor: Color(0xFFf7d46a),
      sources:
          '1- "Potassium", www.healthdirect.gov, Retrieved 21-11-2019. Edited.\n2- "What Does Potassium Do for Your Body? A Detailed Review", www.healthline.com, Retrieved 21-11-2019. Edited.\n3- "14 Healthy Foods That Are High in Potassium", www.healthline.com, Retrieved 23-11-2019. Edited.\n4- "Potassium", www.webmd.com, Retrieved 23-11-2019. Edited.\n5- "Potassium", www.healthline.com, Retrieved 23-11-2019. Edited.\n6- "Hyperkalemia High Blood Potassium", my.clevelandclinic.org, Retrieved 12-5-2019. Edited.\n',
      nutrientFood: potassiumFoodList),
  NutrientsAssets(
      id: 6,
      title: "الكالسيوم",
      image: "assets/images/nutrients/calcium.png",
      description: '''
يعد الكالسيوم من أكثر المعادن وفرة في جسم الإنسان، يتركز معظمه في كل من العظام والأسنان بنسبة تصل إلى 99% من إجمالي كالسيوم الجسم، أما النسبة المتبقية منه والتي تعادل 1% فتتوزع بين عدد من أجزاء الجسم أهمها العضلات والدم والسائل الخلالي أو السائل النسيجي، وهو السائل الذي يملأ المسافات الفاصلة بين خلايا الجسم.\n
تتلخص وظائف الكالسيوم في تمكين العضلات والأوعية الدموية من الانقباض والانبساط، و إفراز كل من الهرمونات والإنزيمات وفي نقل الإشارات والرسائل عبر أجزاء الجهاز العصبي المنتشرة في جميع أنحاء الجسم، ويعد الكالسيوم ركنًا أساسيًا من أركان النظام الغذائي الصحي والمتوازن، و من اهم فوائد الكالسيوم هو المحافظة على صحة العظام ووقايتها من الهشاشة والكسور.''',
      nutrientColor: Color(0xFFa2d4fa),
      sources:
          '1- "Calcium", www.medlineplus.gov, Retrieved 25-11-2019. Edited.\n2- "Health Benefits of Calcium", www.verywellhealth.com, Retrieved 25-11-2019. Edited.\n3- "Top 15 Calcium-Rich Foods (Many Are Non-Dairy)", www.healthline.com, Retrieved 26-11-2019. Edited.\n4- "Hypocalcemia (Calcium Deficiency Disease)", www.healthline.com, Retrieved 26-11-2019. Edited.\n5- "What happens when calcium levels are low?", www.medicalnewstoday.com, Retrieved 26-11-2019. Edited.\n',
      nutrientFood: calciumFoodList),
  NutrientsAssets(
      id: 7,
      title: "الحديد",
      image: "assets/images/nutrients/iron.png",
      description: '''
يحتاج الجسم إلى الحديد من أجل إنتاج خلايا الدم الحمراء، ويعد قادرًا على تخزينه بنسبة 25% لاستخدامه في المستقبل، وذلك في حال عدم تناول الحديد بكميات كافية، فيجري استهلاك المخزون الموجود في الجسم؛ لمنع الإصابة بفقر الدم، ويوجد الكثير من الفوائد الأخرى لعنصر الحديد للجسم، منها:
1- يحسن القدرة المعرفية: يحتاج الدماغ إلى الحديد لأداء الوظائف الإدراكية بكفاءة أفضل؛ إذ إنه يحتاج إلى الدم الذي يحمل الأكسجين ليعمل بطريقة سليمة، ويُستهلَك 20% من الأكسجين الموجود في الدم، فالحديد لا يعزز تدفقه في الدماغ فحسب، لكنه يساعد أيضًا على تعزيز المسارات العصبية لتمنع حدوث بعض المشكلات المعرفية، مثل: مرض الزهايمر، والخرف.\n
2- يعزز تكوين الهيموغلوبين: يعد تكوين الهيموغلوبين من المهام الرئيسة لمعدن الحديد، بما أنه يساعد على نقل الأكسجين إلى خلايا الجسم، ويعد تكوين الهيموغلوبين من الأمور المهمة للغاية في الجسم؛ إذ إن الشخص قد يفقد الدم بطرق عدة عند حدوث الإصابات الداخلية أو الخارجية، كما أن النساء يفقدن كميات كبيرة من الدم شهريًا خلال فترة الحيض، وهو أحد الأسباب الرئيسية التي تجعلهن أكثر عرضةً للإصابة بفقر الدم من الرجال.\n
3- يحسن وظيفة العضلات: يعد الحديد عنصرًا رئيسًا للحفاظ على صحة العضلات، إذ يوجد في أنسجتها، ويساعد على توفير الأكسجين اللازم لانقباض العضلات، ودونه تفقد مرونتها، فضعف العضلات واحد من الأعراض الرئيسية لفقر الدم.''',
      nutrientColor: Color(0xFFafc581),
      sources:
          '1- Susan York Morris and Rachel Nall, RN, BSN, CCRN (16-08-2016), "10 Reasons Why You Might Need Iron Supplements"، www.healthline.com, Retrieved 09-04-2019. Edited.\n2-  Mary Jane Brown (12-8-2017), "10 Signs and Symptoms of Iron Deficiency"، www.healthline.com, Retrieved 2-4-2020. Edited.\n3- "Iron deficiency anemia", www.mayoclinic.org,18-10-2019، Retrieved 2-4-2020. Edited.\n4- Evan M. Braunstein (3-2020), "Iron Deficiency Anemia"، www.merckmanuals.com, Retrieved 2-4-2020. Edited.\n5- Lana Barhum (27-01-2019), "The Health Benefits of Iron"، www.verywellhealth.com, Retrieved 09-04-2019. Edited.\n6- Kiran Patil (14-3-2019), "17 Surprising Benefits Of Iron"، organicfacts, Retrieved 23-3-2019. Edited.\n7- Shereen Lehman (19-02-2019), "Enjoy these 13 foods to get your daily requirement"، www.verywellfit.com, Retrieved 10-04-2019. Edited.\n8-  "Iron deficiency anaemia", www.nhs.uk,12-1-2018، Retrieved 2-4-2020. Edited.\n9- Nancy Moyer (6-6-2019), "What You Need to Know When Anemia and Headaches Happen Together"، www.healthline.com, Retrieved 2-4-2020. Edited.\n',
      nutrientFood: ironFoodList),
  NutrientsAssets(
      id: 8,
      title: "الزنك",
      image: "assets/images/nutrients/zinc.png",
      description: '''
يعد الزنك من المعادن المعروفة الذي له شعبية كبيرة بسبب دوره في تعزيز المناعة، وحماية الجسم من نزلات البرد والحمى، إضافة إلى دوره في إبقاء نظام المناعة في الجسم قويًا ومكافحًا للعدوى.\n
و يعتبر هذا المعدن مهم للعديد من الوظائف في الجسم؛ بما في ذلك إنتاج الطاقة، واليقظة، والمزاج، والحفاظ على وظائف الدماغ الصحية، كما يلعب دورًا مهمًا في عمليات إنتاج الهرمونات، والهضم، والعمليات العصبية، والشفاء في الدماغ والجسم.\n
و يسهم الزنك في أداء الجسم وظائفه الحيوية، ووظائف الخلايا، وانقسامها، ونموها بشكل طبيعي، ويفيد في عملية نمو العضلات وتطورها وإصلاحها، وتمكين الجسم من الحفاظ على قوته العضلية والعظمية.\n
و يساعد الزنك في تسريع التفاعلات الكيميائية لبناء العضلات، وتحقيق التوازن بين مستويات المغذيات، وتنظيم الهرمونات، خاصة التستوستيرون وهرمون النمو، ويساعد أيضًا في عملية تخليق بروتين العضلات بعد أداء التمرينات الرياضية، ويحافظ على حجم العضلات الموجودة.''',
      nutrientColor: Color(0xFFbb867d),
      sources:
          '1- Ravi Teja Tadimalla, "18 Powerful Benefits Of Zinc, Including Boosting Immunity And Combating Cancer"، www.stylecraze.com, Retrieved 9-10-2019. Edited.\n2- Ryan Haas, "Do Zinc Supplements Help Build Muscle?"، www.livestrong.com, Retrieved 9-10-2019. Edited.\n3- Jillian Levy (10-5-2019), "10 Powerful Zinc Benefits, Including Fighting Cancer"، draxe.com, Retrieved 9-10-2019. Edited.\n4- Joseph Nordqvist (5-12-2017), "What are the health benefits of zinc?"، www.medicalnewstoday.com, Retrieved 9-10-2019. Edited.\n5- "Zinc Deficiency", www.healthgrades.com, Retrieved 9-10-2019. Edited.\n6- Makayla Meixner (16-6-2018), "7 Signs and Symptoms of Zinc Overdose"، www.healthline.com, Retrieved 9-10-2019. Edited.\n',
      nutrientFood: zincFoodList),
  NutrientsAssets(
      id: 9,
      title: "الفسفور",
      image: "assets/images/nutrients/phosphorous.png",
      description: '''
يعد الفوسفور برفقة الكالسيوم أهم المعادن التي تحتاجها العظام لتنمو وتكتسب قوتها التي توافق وظيفتها، أيضًا فهو ثاني أكثر العناصر وفرة في الجسم بعد الكالسيوم، وتتراوح المستويات الطبيعية من الفوسفور في الدم لدى الأشخاص البالغين بين 2.5 إلى 4.5 ملغم/ ديسيلتر، وقد يتسبب ارتفاع مستوى الفوسفور في الجسم إلى نتائج عكسية على صحة العظام بشكل خاص.\n
و يعد الفسفور من أهم العناصر في عملية تكوين البروتين، والتي تساعد أكثر في عملية التكاثر، كما أنه يسهل الاستخدام الأقصى للبروتينات في جسم الإنسان لضمان النمو السليم للخلايا، كما يساعد على استخدام الكربوهيدرات والدهون.''',
      nutrientColor: Color(0xFFf9bb92),
      sources:
          '1- "Phosphorus in Your Diet", www.healthline.com, Retrieved 2020-04-25. Edited.\n2- "10 Amazing Benefits Of Phosphorus", www.organicfacts.net, Retrieved 2020-04-25. Edited.\n3- "What Is Phosphorus?", www.webmd.com, Retrieved 2020-04-25. Edited.\n4- Robin Madell (14-12-2015), "Phosphorus in Your Diet"، www.healthline.com, Retrieved 25-1-2019. Edited.\n5- Ashley Marcin (12-3-2018), "Phosphorus Deficiency"، www.healthline.com, Retrieved 25-1-2019. Edited.\n6- Erica Julson (3-7-2018), "Top 12 Foods That Are High in Phosphorus"، www.healthline.com, Retrieved 25-1-2019. Edited.\n7- "Phosphorus in diet", www.medlineplus.gov, Retrieved 24-1-2019. Edited.\n',
      nutrientFood: phosphorousFoodList),
  NutrientsAssets(
      id: 10,
      title: "فيتامين أ",
      image: "assets/images/nutrients/vitaminA.png",
      description:
          "يعد فيتامين أ (vitamin A) أحد الفيتامينات الذائبة في الدهون، ويؤدي هذا الفيتامين دوراً أساسياً في القيام بالعديد من وظائف الجسم، كالحفاظ على صحة البصر، ونمو الجسم، وصحة الجهاز التناسلي، والوظائف المناعية؛ إذ إنه يساهم في تكوين الأجسام المضادة التي تقاوم المواد الضارة التي تمكنت من عبور خطوط الدفاع في الجسم، ويعد نقص فيتامين أ من الأسباب الأساسية التي تؤدي إلى الإصابة بالعمى، وخاصةً لدى سكان الدول النامية، في حين إن سكان الدول المتقدمة غالباً ما يتناولون ما يكفي حاجتهم من هذا الفيتامين، ومن الجدير بالذكر أن تناول نسبة كافية من فيتامين أ عن طريق النظام الغذائي قد يساهم في تقليل خطر الإصابة بأعراض نقصه التي تتمثل بفقدان الشعر، وبعض مشاكل الجلد، وجفاف العين، والعشى الليلي، وزيادة خطر الإصابة بالعدوى، واضطرابات الغدة الدرقية.",
      nutrientColor: Color(0xFFe1b39b),
      sources:
          '1- "Vitamin A", www.mayoclinic.org, Retrieved 5-1-2020. Edited.\n2- "Vitamin A Benefits Eye, Skin & Bone Health", www.draxe.com, Retrieved 5-1-2020. Edited.\n3- "Vitamin A deficiency", www.dermnetnz.org, Retrieved 5-1-2020. Edited.\n4- "Everything you need to know about vitamin A", www.medicalnewstoday.com, Retrieved 5-1-2020. Edited.\n6- "Vitamin A", medlineplus.gov,6-1-2020، Retrieved 14-1-2020. Edited.\n7-Jayne Leonard (19-2-2019), "Which foods are rich in vitamin A?"، www.medicalnewstoday.com, Retrieved 14-1-2020. Edited.\n8- "Vitamin A", ods.od.nih.gov,11-10-2019، Retrieved 14-1-2020. Edited.\n 9- Atli Arnarson (19-4-2017), "20 Foods That Are High in Vitamin A"، www.healthline.com, Retrieved 14-1-2020. Edited.\n',
      nutrientFood: vitaminAFoodList),
  NutrientsAssets(
      id: 11,
      title: "فيتامين د",
      image: "assets/images/nutrients/vitaminD.png",
      description: '''
فيتامين د (vitamin D) هو أحد العناصر الغذائية التي يحتاجها جسمك لبناء عظام صحية والحفاظ عليها، وذلك لأن جسمك لا يمكنه امتصاص الكالسيوم - المُكوِّن الرئيسي للعظام - إلا عند وجود فيتامين د. 
كما ينظم فيتامين د أيضًا الكثير من الوظائف الأخرى في خلايا جسمك، وتدعم كذلك خصائصه المضادة للالتهابات وللأكسدة والواقية للأعصاب صحة الجهاز المناعي ووظائف العضلات ونشاط خلايا الدماغ.
لا يوجد فيتامين د في الكثير من الأطعمة طبيعيًا، ولكن يمكن الحصول عليه من الحليب المعزز، وحبوب الإفطار المدعمة بالعناصر الغذائية، والأسماك الدهنية، مثل السلمون والماكريل والسردين. 
وتعتبر الشمس من أفضل المصادر الطبيعية للحصول على فيتامين د، حيث يمتص الجلد أشعة الشمس، ومن ثم يستطيع الجسم إنتاج هذا الفيتامين من تلقاء نفسه.
و يجب التعرض لأشعة الشمس في فترة الصباح الباكر والعصر، على أن يُراعى الابتعاد عن التعرض للشمس في الفترة من الساعة 11 حتى 3 مساءً، وذلك للحصول على فيتامين د دون الإصابة بأي مشكلات جلدية.''',
      nutrientColor: Color(0xFFf4c192),
      sources:
          '- Adit Ginde, Jonathan Mansbach, Carlos Camargo (23-2-2009), "Association Between Serum 25-Hydroxyvitamin D Level and Upper Respiratory Tract Infection in the Third National Health and Nutrition Examination Survey", Archives of internal medicine, Issue 4, Folder 169, Page 384-390. Edited.\n2- Jennifer Warner (23-2-2009), "Low Vitamin D Levels Linked to Colds"، www.webmd.com, Retrieved 14-1-2020. Edited.\n3- Seong-Hwan Moon, Seok Woo Kim, Hak-Sun Kim, and others (3-2013), "Prevalence of Vitamin D Deficiency in Patients with Lumbar Spinal Stenosis and Its Relationship with Pain", pain physician journal, Issue 2, Folder 16, Page 165-176. Edited.\n4- Mikel Theobald (22-1-2015), "7 Supplements That Help Back Pain"، www.everydayhealth.com, Retrieved 14-1-2020. Edited.\n5- Zawn Villines (24-6-2017), "Why am I not getting enough vitamin D?"، www.medicalnewstoday.com, Retrieved 13-1-2020. Edited.\n',
      nutrientFood: vitaminDFoodList),
  NutrientsAssets(
      id: 12,
      title: "فيتامين هـ ",
      image: "assets/images/nutrients/vitaminE.png",
      description:
          "فيتامين هـ (vitamin E) يصنف على أنه أحد الفيتامينات القابلة للذوبان في الدهون، أي أن الجسم يقوم بتخزينه في الخلايا، ليتم استخدامه حسب حاجته إليه، ويعد هذا الفيتامين أحد أقوى مضادات الأكسدة التي تحارب الجذور الحرة التي قد تظهر في الجسم، والمسؤولة عن تسريع عملية الشيخوخة، الأمر الذي يجعله أحد الفيتامينات الهامة جداً لصحة البشرة، والشعر على حدٍ سواء، لذلك يوجد في تركيب العديد من المنتجات التجميلية، ويمكن الحصول عليه من مصادر غذائية متنوعة، أو من خلال تناول المكملات الغذائية الخاصة به.",
      nutrientColor: Color(0xFFa9a9a9),
      sources:
          '1- Cathleen Stuart (14-5-2018), "What are the symptoms of low vitamin E?"، www.medicalnewstoday.com, Retrieved 2-4-2020. Edited.\n2- Aleksa Ristic (29-3-2020), "Vitamin E Deficiency Signs & Symptoms + Ways to Prevent It"، www.selfhacked.com, Retrieved 3-4-2020. Edited.\n3- Simin Meydani, Sung Han, Dayong Wu (9-5-2005), "Vitamin E and immune response in the aged: molecular mechanisms and clinical implications", Immunological reviews, Issue 1, Folder 205, Page 269-284. Edited.\n4- Tyler Kemnic, Meghan Coleman. (16-11-2019), "Vitamin E Deficiency"، www.ncbi.nlm.nih.gov, Retrieved 2-4-2020. Edited.\n5- "Vitamin E", www.ods.od.nih.gov, Retrieved 2-4-2020. Edited.\n6- Larry Johnson, "Vitamin E Deficiency"، www.msdmanuals.com, Retrieved 4-4-2020. Edited.\n',
      nutrientFood: vitaminEFoodList),
  NutrientsAssets(
      id: 13,
      title: "فيتامين ك",
      image: "assets/images/nutrients/vitaminK.png",
      description: '''
يقدم فيتامين ك (vitamin K) مجموعة متنوعة من الفوائد الصحية من الحفاظ على قوة العظام إلى الوقاية المحتملة من أمراض القلب، وهو مهم بشكل خاص لشفاء الجروح، حيث يساعد على تجلط الدم، وفي ما يلي ثلاث فوائد صحية لفيتامين ك مثبتة علميا:
1. يعد فيتامين ك ضروريا لتخثر الدم، ما يساعد على التئام الجروح ومنع النزيف المفرط ومن دون تخثر الدم، فإن أي إصابة قد تؤدي إلى النزيف حتى الموت.\n
2. يلعب فيتامين ك دورا في صحة العظام لأنه تماما مثل كل عضو وأنسجة في أجسامنا، تموت الخلايا العظمية باستمرار ويتم استبدالها. ويلعب فيتامين ك دورا مهما في عملية دوران الخلايا هذه، ما يعزز دورة نمو الخلايا واستبدالها الذي يحافظ على قوة عظامك ويبقيها مقاومة للكسر.\n
3. فيتامين ك قد يقي من أمراض القلب''',
      nutrientColor: Color(0xFF91ab4e),
      sources:
          '1- Renata Górska "Vitamin K Deficiency", www.sciencedirect.com, Retrieved 4-1-2020. Edited.\n2- Barbara Delage (7-2014),"Vitamin K", www.lpi.oregonstate.edu, Retrieved 5-1-2020. Edited.\n3- Bethany Cadman (23-12-2017), "Vitamin K deficiency: What you need to know"، www.medicalnewstoday.com, Retrieved 4-1-2020. Edited.\n4- Brett Smiley (21-6-2017), "Understanding Vitamin K Deficiency"، www.healthline.com, Retrieved 20-1-2020. Edited.\n5- "Vitamin K Deficiency", www.labtestsonline.org,18-10-2019، Retrieved 20-1-2020. Edited.\n6- Dieu Khoa (27-9-2017), "Vitamin K Deficiency Clinical Presentation"، www.emedicine.medscape.com, Retrieved 20-1-2020. Edited.\n7- "Vitamin K deficiency", www.healthdirect.gov.au, (5-2018), Retrieved 20-1-2020. Edited.\n8- "Vitamin K Deficiency Bleeding", www.cdc.gov,19-12-2019، Retrieved 20-1-2020. Edited.\n9- "Vitamin K Deficiency Bleeding", www.cdc.gov,19-12-2019، Retrieved 20-1-2020. Edited.\n10- Larry Johnson (10-2019), "Vitamin K Deficiency"، www.merckmanuals.com, Retrieved 6-1-2020. Edited.\n11- Brett Smiley (16-6-2017), "The Best 15 Foods for Vitamin K"، www.healthline.com, Retrieved 3-12-2019. Edited.\n',
      nutrientFood: vitaminKFoodList),
  NutrientsAssets(
      id: 14,
      title: "فيتامين ج",
      image: "assets/images/nutrients/vitaminC.png",
      description: '''
فيتامين ج  (vitamin C) هو عنصر غذائي حيوي مهم لصحة الجسم، ويعتبر فيتامين ج أحد المركبات العضوية الموجودة في الكائنات الحية، فهو يحتوي على عنصر الأكسجين والكربون، كما أنه فيتامين قابل للذوبان في الماء ولا يخزنه الجسم، ومن الجدير بالذكر أنه للحفاظ عليه بمستوى كافٍ من فيتامين ج في الجسم، فإن ذلك يتطلب تناول مصادره بشكل يومي، من الجدير بالذكر أن فيتامين ج يلعب دوراً مهماً في أداء عدد من وظائف الجسم، ومنها: 
- يساعد على حماية الخلايا والحفاظ عليها.
- يساعد على حصة الجلد و الأوعية الدموية والعظام والغضاريف.
- يساعد في التئام الجروح.
- يساعد على تصنيع الكولاجين.
- يعمل كمضاد للأكسدة, مما يقلل خطر الإصابة ببعض أنواع السرطان..
- يحسن معدل امتصاص الحديد.''',
      nutrientColor: Color(0xFFfcce83),
      sources:
          '1- Joseph Nordqvist (10-4-2017), "Vitamin C: Why is it important?"، www.medicalnewstoday.com, Retrieved 18-2-2018. Edited.\n2- Ana Erkic, "All You Need To Know About Vitamin C Benefits and Recipes To Boost Your Daily Intake"، www.lifehack.org, Retrieved 18-2-2018. Edited.\n3- Kathleen M. Zelman, MPH, RD, LD (7-1-2010), "The Benefits of Vitamin C"، www.webmd.com, Retrieved 18-2-2018. Edited.\n4- Signs and Symptoms of Vitamin C Deficiency, , "www.healthline.com", Retrieved in 2-02-2019, Edited.\n5- Vitamin C, , "www.mayoclinic.org", Retrieved in 2-02-2019, Edited.\n6- Top Foods High In Vitamin C, , " www.everydayhealth.com", Retrieved in 2-02-2019, Edited.\n',
      nutrientFood: vitaminCFoodList),
  NutrientsAssets(
      id: 15,
      title: "مجموعة فيتامين ب",
      image: "assets/images/nutrients/vitaminB12.png",
      description:
          "تساهم فيتامينات المجموعة ب (vitamin b complex) في العديد من الوظائف الحيوية في جسم الإنسان؛ حيث إنها تلعب دوراً مهماً في تقليل خطر الإصابة بالعدوى، والحفاظ على صحة الخلايا، وتعزيز نمو وصحة خلايا الدم الحمراء، وتنظيم مستويات الطاقة وإنتاج الهرمونات والكوليسترول في الجسم، وتعزيز سلامة الرؤية، ووظائف الدماغ والأعصاب، وصحة القلب والأوعية الدموية، والهضم، وتنظيم الشهية، وقوة العضلات، كما تعد هذه الفيتامينات مهمة بشكل خاص للمرأة الحامل ، فهي تساعد على نمو دماغ الطفل، وتقليل خطر إصابة الطفل بالعيوب الخلقية، وزيادة مستويات الطاقة، وتخفيف أعراض الغثيان، وتقليل خطر تعرض الأُم لحالة ما قبل تسمم الحمل.",
      nutrientColor: Color(0xFFf0b99c),
      sources:
          '1- Emily Cronkleton (2-4-2018), "Why Is Vitamin B Complex Important, and Where Do I Get It?"، www.healthline.com, Retrieved 25-12-2019. Edited.\n2- "Vitamin B1 (Thiamine)", www.medindia.net, Retrieved 7-2-2020. Edited.\n3- "Thiamin", www.medlineplus.gov, Retrieved 7-2-2020. Edited.\n4- "THIAMINE (VITAMIN B1)", www.webmd.com, Retrieved 9-2-2020. Edited.\n5- Christian Nordqvist (7-3-2017), "Benefits and sources of vitamin B2"، www.medicalnewstoday.com, Retrieved 7-2-2020. Edited.\n6- Patrick Skerrett (10-1-2013), "Vitamin B12 deficiency can be sneaky, harmful"، www.health.harvard.edu, Retrieved 5-1-2019. Edited.\n7- Helen West (7-10-2017), "9 Signs and Symptoms of Vitamin B12 Deficiency"، www.healthline.com, Retrieved 5-1-2019. Edited.\n8- John Lindenbaum, Edward Healton, David Savage And Others (30-6-1988), "Neuropsychiatric Disorders Caused by Cobalamin Deficiency in the Absence of Anemia or Macrocytosis", The New England Journal Of Medicine, Issue 26, Folder 318, Page 1720-1728. Edited.\n',
      nutrientFood: vitaminBFoodList),
];
