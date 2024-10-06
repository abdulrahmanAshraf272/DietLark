import 'package:flutter/material.dart';
import 'package:food_app/models/diseases_lists.dart';
import 'package:food_app/models/food_categories_lists.dart';

class DiseasesAssets {
  int id;
  final String title, subtitle, image, description, sources;
  final List diseasesFood;

  DiseasesAssets(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.description,
      required this.sources,
      required this.diseasesFood});
}

List<DiseasesAssets> diseasesList = [
  DiseasesAssets(
      id: 1,
      title: "أكلات لتحسين المزاج",
      subtitle: "تحسين المزاج",
      image: "assets/images/diseases/happy.jpg",
      description:
          "الأكل جزء أساسي من حياة الإنسان، ليس فقط للحفاظ على صحتنا الجسدية، ولكن على الصحة العقلية أيضاً، إذ إن كل ما نأكله يمكن أن يؤثر على أدمغتنا، إضافة إلى أن تناول الطعام في أوقات منتظمة قد يساهم في الحفاظ على الدماغ، ويحمي من مشاكل مثل الاكتئاب والقلق، ويحسن من عملية التمثيل الغذائي كما ان الطعام المتناول يؤثر على المزاج، حيث وجد أن كلاً من حمض الفوليك، وفيتامين ب 12 لهما دوراً في الوقاية من اضطرابات المزاج، حيث تم ربط الاكتئاب بنقص هذه العناصر الغذائية.\nوأوضحت الدراسات أنه هناك تداخلًا بين الدوائر العصبية التي تحكم الأكل والمزاج، حيث تؤثر هرمونات الجهاز الهضمي على الدوبامين، وهو ناقل عصبي يلعب دوراً كبيراً في الحالة المزاجية والطاقة والمتعة، والأفراد المصابون بالاكتئاب والاضطراب ثنائي القطب لديهم مستويات غير طبيعية من الدوبامين، ويُعتقد أن تغير نظام الأكل غير المنتظم يساهم في سوء الحفاظ على الحالة المزاجية.",
      sources:
          '1- "Foods to Uplift Your Mood", webmd, Retrieved 30/8/2021. Edited.\n2- Ways to Boost Your Mood With Food", verywellmind, Retrieved 30/8/2021. Edited.\n3- "9 Healthy Foods That Lift Your Mood", healthline, Retrieved 30/8/2021. Edited.\n4- Mood Boosting Foods", culinarynutrition, Retrieved 30/8/2021. Edited.\n5- "Does What You Eat Affect Your Mood?", clevelandclinic, Retrieved 30/8/2021. Edited.\n6- "How to be happier", nhs, Retrieved 30/8/2021. Edited.\n7- "10 Simple Ways to Improve Your Mood When You are Feeling Down", psychologytoday, Retrieved 30/8/2021. Edited.\n8- "8 Ways to Boost Your Mood Naturally", cnm, Retrieved 30/8/2021. Edited.\n9- "Your Familys Mental Health: 10 Ways to Improve Mood Naturally", sohapediatrics, Retrieved 30/8/2021. Edited.\n',
      diseasesFood: moodFoodList),
  DiseasesAssets(
      id: 2,
      title: "أكلات لتقوية المناعة",
      subtitle: "المناعة",
      image: "assets/images/diseases/running.jpg",
      description:
          "يُعد الجهاز المناعي الجهاز المسؤول عن حماية الجسم والدفاع عنه أمام الميكروبات المختلفة والخلايا السرطانية والأجسام الغريبة، إذ إن خلايا الجهاز المناعي قادرة على التفريق بين الخلايا الصحية السليمة في الجسم، والخلايا المريضة أو غير الطبيعية، ولذلك فإننا نجد أن الأشخاص الذين يعانون من مشاكل في الجهاز المناعي يصابون بعدوى والتهابات لا تصيب الأصحاء، ومن الجدير بالعلم أن الجهاز المناعي معقد للغاية، ومنه ما يتركز في جزء محدد من الجسم، ومنه ما يعوم في الدم، وعلى أية حال فإن المشاكل المرتبطة بالجهاز المناعي قد تظهر تحت ظرف من اثنين؛ إما بسبب عدم تفعيل الجهاز المناعي عند تعرض الجسم لميكروب أو جسم غريب وهذا ما يسبب المرض ويُحدث العدوى، أو بسبب تنشيط الجهاز المناعي في وقت غير مناسب، بمعنى أن الخلايا سليمة والأمر لا يحتاج تفعيل للجهاز المناعي ومع ذلك تم تنشيطه.",
      sources: "",
      diseasesFood: immunityFoodList),
  DiseasesAssets(
      id: 3,
      title: "أكلات للوقاية من هشاشة العظام",
      subtitle: "هشاشة العظام",
      image: "assets/images/diseases/osteoporosis.jpg",
      description:
          "هشاشة العظام ، أو تخلخل العظام أو مرض الهشاشة، هو المرض الذي يتمثل بقلة كثافة العظام وتلف بنيتها إلى درجة تجعل العظام هشة وقابلة للكسر، وحقيقة إن هذا المرض صامت بمعنى أنه لا يرافقه ظهور أعراض في العادة، فعادة ما يُكشف عنه عند حدوث كسر في العظام؛ إذ تكون العظام قد خسرت الكثير من بنيتها وقوتها على مدار عدة سنوات، وإن أكثر العظام تأثرًا بمرض الهشاشة عظام الرسغين والوركين وكذلك عظام العمود الفقري. فيجب على الأشخاص تناول طعام صحي لتغطية الاحتياج اليومي للكالسيوم , و يعد فيتامين د مهم لامتصاص الكالسيوم مما يمنع خسارة العظام.",
      sources:
          '1- "Osteoporosis", www.mayoclinic.org, Retrieved 19-11-2019. Edited.\n2 "Osteoporosis", www.medicinenet.com, Retrieved 19-11-2019. Edited.\n3- "What Do You Want to Know About Osteoporosis?", www.healthline.com, Retrieved 19-11-2019. Edited.\n4- "Osteoporosis", www.emedicinehealth.com, Retrieved 19-11-2019. Edited.\n5- "What to know about osteoporosis", www.medicalnewstoday.com, Retrieved 19-11-2019. Edited.\n6- Susan L Sullivan, "Prevent Osteoporosis Through Your Diet"، www.everydayhealth.com, Retrieved 9-3-2019. Edited.\n7- Pauline M. Camacho, "Risk Factors for Osteoporosis"، www.endocrineweb.com, Retrieved 9-3-2019. Edited.\n8- Carol Eustice (29-5-2018), "Osteoporosis Pain Management"، www.verywellhealth.com, Retrieved 9-3-2019. Edited.\n',
      diseasesFood: osteoporosisFoodList),
  DiseasesAssets(
      id: 4,
      title: "أكلات لتقوية الذاكرة",
      subtitle: "الذاكرة",
      image: "assets/images/diseases/memory.jpg",
      description:
          "يرى العلماء والباحثون أن هناك ثلاثة أنواع من الذاكرة البشرية على الأقل، وهي تمثل أيضًا ثلاثة مستويات أو مراحل في عملية التسجيل والتخزين والاسترجاع، حيث تُسلم كلٌّ منها المعلومات من الذاكرة أو المرحلة إلى التي تليها:\n1- الذاكرة الحسية: التي لا تدوم خلالها المدركات لأكثر من ثوان معدودة، وهي أشبه بالانطباع القصير المدى عن المؤثرات الحسية بمختلف أنواع الإحساس، التي نراها عقب اختفاء تلك المؤثرات المادية نفسها، وتتسم هذه الذاكرة بقدرة هائلة على تسجيل المعلومات غير المفسرة، والتي سرعان ما تتلاشى.\n2- الذاكرة قصيرة المدى: تستطيع الاحتفاظ بعدد محدود من المعلومات، واستردادها لمدة تتراوح ما بين بضع ثوان قصيرة إلى دقيقة كاملة، وتعد سعتها محدودة للغاية بعكس الذاكرة الحسية، التي تعد لا نهائية بالنظر لقدرتها على استقبال البيانات الجديدة، وعادةً تستطيع الذاكرة قصيرة المدى أن تختزن من أربع إلى خمس معلومات.\n3- الذاكرة طويلة المدى: تستطيع تخزين كميات كبيرة جدا من المعلومات لأوقات طويلة جدا من الزمن، تمتد في كثير من الأحيان لحياة الإنسان بأكملها، غير أن وجوه الاختلاف بين الذاكرة قصيرة المدى، والذاكرة طويلة المدى -تتعدى التباين في حجم سعة التخزين، والكم الزمني للاحتفاظ بالمعلومات؛ إذ إنه يتعلق بجوهر المعالجة، فالذاكرة طويلة المدى تعالج المعلومات بطريقة معقدة متشابكة ذات أبعاد متراكبة؛ بحيث يصح أن نعتبر أن الذاكرة طويلة المدى- التي تحوي سجلات متكاملة عن كل ما نعيه ونعرفه عن العالم من حولنا.",
      sources:
          '1- Carol Sorgen (18-12-2008), "Eat Smart for a Healthier Brain"، www.webmd.com, Retrieved 03-06-2019. Edited.\n2- Smitha Bhandari (14-11-2017), "Slideshow: Brain Foods That Help You Concentrate "، www.webmd.com, Retrieved 03-06-2019. Edited.\n3- Betty Kovacs Harbolic (11-08-2017), "What Foods Improve Your Memory?"، www.medicinenet.com, Retrieved 03-06-2019. Edited.\n4- Lana Burgess (19-12-2018), "12 foods to boost brain function"، www.medicalnewstoday.com, Retrieved 03-06-2019. Edited.\n5- Kerri-Ann Jennings (09-05-2017), "11 Best Foods to Boost Your Brain and Memory"، www.healthline.com, Retrieved 03-06-2019. Edited.\n',
      diseasesFood: memoryImproveFoodList),
  DiseasesAssets(
      id: 5,
      title: "أكلات لتقوية الأعصاب",
      subtitle: "الأعصاب",
      image: "assets/images/diseases/nerveses.jpg",
      description:
          "تكمن أهمية تقوية الأعصاب بأن لها دوراً مهماً وفعالاً في التحكم بكثير من وظائف الجسم وردود أفعاله اتجاه ما يواجهه، حيث إن العصب عبارة عن مجموعة من الشعيرات الدقيقة المرتبطة، والتي تقوم بنقل الإشارات بين الجهاز العصبي المركزي الذي يشمل المخ، والمخيخ، والنخاع الشوكي، وبين باقي أعضاء الجسم، وبذلك يتم ما يسمى بالفعل ورد الفعل بالجسم، من خلال نقل الإحساس (الفعل) من العضو بمساعدة الأعصاب إلى المخ، والذي يقوم بدوره بإرسال الأوامر للعضو (رد الفعل).",
      sources:
          '1- CHRISTY CALLAHAN (14-8-2017), "Exercises for Nerve Regeneration"، www.livestrong.com, Retrieved 26-2-2018. Edited.\n2- Brown (23-1-2017), "9 Ways On How To Strengthen Nervous System Health Naturally"، www.vkool.com, Retrieved 26-2-2018. Edited.\n3- "Exercise + Physical Therapy For Neuropathy", www.foundationforpn.org, Retrieved 27-2-2018. Edited.\n4- "Anxiety and Peripheral Neuropathy", Calm Clinic. Edited.\n',
      diseasesFood: nervesesFoodList),
  DiseasesAssets(
      id: 6,
      title: "أكلات لمرضى الأنيميا",
      subtitle: "الأنيميا",
      image: "assets/images/diseases/anemia.jpg",
      description:
          "الأنيميا او كما يعرف أيضاً بفقر الدم هي أحد الحالات المرضية التي تكون فيها خلايا الدم الحمراء أقل من الحد الكافي للجسم ليقوم بوظائفه المختلفة، فخلايا الدم الحمراء هي أحد الخلايا الموجودة في الدم والمسؤولة عن حمل الأكسجين من الرئتين ونقله إلى مختلف أجزاء الجسم، ثم نقل ثاني أكسيد الكربون إلى الرئتين لطردها خارج الجسم، وعند عدم وجود كمية كافية من هذه الخلايا تصبح كمية الأكسجين الواصلة إلى الجسم أقل من مقدار حاجته وهو ما يؤثر على وظائفه بشكل عام , و من اعراض الانيميا الضعف، الارهاق، شحوب الجلد أو اصفراره، عدم انتظام ضربات القلب، الدوار أو الدوخة.",
      sources:
          '1- "Anemia , overveiw", www.mayoclinic.org, Retrieved 29/3/2018. Edited.\n2- "Anemia , Practice Essentials", www.emedicine.medscape.com, Retrieved 29/3/2018. Edited.\n3- "Global anaemia prevalence and number of individuals affected", www.who.int, Retrieved 29/3/2018. Edited.\n',
      diseasesFood: anemiaFoodList),
  DiseasesAssets(
      id: 7,
      title: "أكلات لمرضى القولون العصبي",
      subtitle: "القولون العصبي",
      image: "assets/images/diseases/colon.jpg",
      description:
          "تختلف أعراض متلازمة القولون العصبي المعروف أيضًا بمتلازمة الأمعاء الهيوجة من شخص إلى آخر، فمن الممكن أن تتطور جميع الأعراض لدى المريض أو قد يظهر جزء منها، ويشار إلى أن هذه الحالة قد يتخللها وجود حركة طبيعية للأمعاء لعدة أيام، وعادة ما تكون الأعراض ذات شدة خفيفة لدى معظم المرضى، إلا أن هناك بعض الأشخاص الذين قد يعانون من أعراض شديدة تؤثر في حياتهم اليومية، وفي هذا السياق يشار إلى أن متلازمة القولون العصبي تبدأ بالتطور عادة في سن البلوغ، وتعد متلازمة القولون العصبي أكثر شيوعًا لدى النساء مقارنة بالرجال، وغالبًا ما تزداد شدة الأعراض سوءًا أثناء فترة الدورة الشهرية، وتجدر الإشارة إلى أن التغيرات في وظيفة الأمعاء من الأمور الشائعة في فترة الحمل بما قد يتسبب بالمعاناة من الأعراض.",
      sources:
          '1- "Irritable Bowel Syndrome (IBS)", familydoctor, Retrieved 24-1-2020. Edited.\n2- "Patient education: Irritable bowel syndrome (Beyond the Basics)", uptodate, Retrieved 24-1-2020. Edited.\n3- "Irritable bowel syndrome (IBS)", healthdirect, Retrieved 24-1-2020. Edited.\n',
      diseasesFood: colonFoodList),
  DiseasesAssets(
      id: 8,
      title: "أكلات للوقاية من السرطان",
      subtitle: "الوقاية من السرطان",
      image: "assets/images/diseases/cancer.jpg",
      description:
          "كما يُقال درهم وقاية خير من قنطار علاج، وكذلك الحال مع السرطان؛ حيث تساهم الوقاية من السرطان في تقليل فرص الإصابة به، وبالتالي تقليل الأعباء المختلفة الناتجة عن ازدياد عدد حالات السرطان الجديدة وعدد الوفيات الناتجة عنه، ويمكن الوقاية من السرطان عن طريق معرفة عوامل الخطر المرتبطة بالجينات، أو في أنماط الحياة، أو في البيئة المحيطة، والإلمام بآلية التعامل معها.\n إن لإتباع نظام غذائي صحي دور في الوقاية من العديد من الأمراض الخطيرة، ويعد السرطان أحد هذه الأمراض، فما يتم تناوله من أطعمة ومشروبات أو يتم تجنبه يكون ذو تأثير قوي في الصحة، ولتحقيق الهدف الوقائي من الغذاء فإنه يجب تضمين النظام الغذائي مجموعة متنوعة من الأطعمة الغنية بمضادات الأكسدة .",
      sources:
          '1- "Cancer Prevention Overview (PDQ®)Patient Version", www.cancer.gov,February 21, 2020، Retrieved 18/5/2020. Edited.\n2- "Cancer Prevention Diet", www.helpguide.org,April 2020، Retrieved 18/5/2020. Edited.\n3- "Cancer Prevention Eating Guidelines", www.healthlinkbc.ca, Retrieved 18/5/2020. Edited.\n4- "Cancer prevention: 7 tips to reduce your risk", Www.middlesexhealth.org,Nov 28, 2018، Retrieved 18/5/2020. Edited.\n5- "Cancer prevention: 7 tips to reduce your risk", www.mayoclinic.org,Nov. 28, 2018، Retrieved 18/5/2020. Edited.\n',
      diseasesFood: cancerFoodList),
  DiseasesAssets(
      id: 9,
      title: "أكلات لمحاربة عسر الهضم",
      subtitle: "عسر الهضم",
      image: "assets/images/diseases/goodStomach.jpg",
      description:
          "عسر الهضم، أو سوء الهضم، أو اضطراب المعدة هو الحالة التي تتمثل بالشعور بألم أو حرقة في الجزء العلوي من البطن، ولا يعد عسر الهضم مرضًا أو مشكلة قائمة بذاتها، وإنما قد يكون في بعض الحالات عرضًا لمشكلة في الجهاز الهضمي، كالإصابة بالقرحة الهضمية أو مشكلة في المرارة، وحقيقة إن أغلب حالات عسر الهضم تعزى لنمط الحياة المتبع؛ فقد تظهر أعراض عسر الهضم نتيجة تناول طعام معين، أو أخذ دواء ما، أو شرب شراب، ومما تجدر الإشارة إليه أن عسر الهضم يختلف عن حرقة المعدة، على الرغم من أن محفزات ظهور الأعراض قد تكون متشابهة وكذلك قد يتشابه العلاج، وإن كثيرًا من الأشخاص الذين يعانون من إحدى الحالتين يشعرن بالأخرى كذلك، ولفهم الفرق بينهما يجدر توضيح أن حرقة المعدة تتمثل بارتداد الحمض الموجود فيها إلى المريء الموجود أعلاها، الأمر الذي يُسبب الشعور بالحرقة في الصدر أو الحلق، وبالعودة للحديث عن عسر الهضم فإن هذه الحالة قد تكون على أحد أنواع ثلاث؛ إما عسر الهضم المتقطع والذي يحدث مرة بين الحين والآخر، وإما عسر الهضم المزمن ، والذي يحدث بشكل منتظم أو مستمر لعدة أسابيع أو ربما أشهر، وإما النوع الثالث والأخير الذي يُعرف بعسر الهضم الوظيفي ، وهذا النوع يتمثل بظهور الأعراض بشكل مزمن ودون وجود سبب محدد.",
      sources:
          '1- "Upset Stomach (Indigestion)", my.clevelandclinic.org, Retrieved March 7, 2020. Edited.\n2- "Indigestion", www.mayoclinic.org, Retrieved March 7, 2020. Edited.\n3- "Indigestion and Heartburn Differences", www.verywellhealth.com, Retrieved March 7, 2020. Edited.\n4- "Indigestion", www.urmc.rochester.edu, Retrieved March 7, 2020. Edited.\n5- "Heartburn", medlineplus.gov, Retrieved 22-3-2020. Edited.\n6- "Definition & Facts of Indigestion", www.niddk.nih.gov, Retrieved March 7, 2020. Edited.\n',
      diseasesFood: indigestionFoodList),
  DiseasesAssets(
      id: 10,
      title: "أكلات لمحاربة ألتهاب المفاصل",
      subtitle: "ألتهاب المفاصل",
      image: "assets/images/diseases/joinPain.jpg",
      description: '''
التهاب المفاصل هو التهاب يمكن أن يصيب الركبتين، أو مفاصل كف اليد، أو قسمًا من العمود الفقري، النوعان الأكثر انتشارًا من التهاب المفاصل، هما: الفـصال العظمي، والتهاب المفاصل الروماتويدي، و يعد الوجع والتيبس في المفاصل هي الأعراض الأساسية لالتهاب المفاصل. 
تلف وتمزق الغضروف قد يولـدان وضعًا تتحرك فيه العظام الواحدة على ظهر الأخرى ممّا يُسبب تآكلهما معًا، وهذا يسبب الألم ويحد من مدى حركة المفصل, و بعض أنواع التهاب المفاصل هي وراثية، ولذا فإن احتمال الإصابة بهذه الأنواع يكون أعلى لدى الأشخاص ذوي التاريخ العائلي مع المرض أي الذين لديهم آباء، أو أمهات، أو أشقاء، أو شقيقات أصيبوا بالمرض من قبل.''',
      sources:
          '1- "The Basics of Arthritis", www.webmd.com, Retrieved 13-1-2019. Edited.\n2- "Arthritis", www.healthline.com, Retrieved 13-1-2019. Edited.\n3- "arthritis", www.mayoclinic.org, Retrieved 13-1-2019. Edited.\n',
      diseasesFood: jointPainFoodList),
  DiseasesAssets(
      id: 11,
      title: "أكلات لمرضى ضغط الدم",
      subtitle: "ضغط الدم",
      image: "assets/images/diseases/highPressure.jpg",
      description:
          "يُعرف مرض ارتفاع ضغط الدم بأنه القاتل الصامت، وذلك لعدم ظهور أي أعراض أولية للمرض، وعادةً لا يمكن لمرضى الضغط معرفة ذلك إلا في حال تم قياس مستوى ضغط الدم، وملاحظة ارتفاعه إلى 80/130 او أكثر من ذلك، وفي الحقيقة في حال ارتفع مستوى الضغط بشكل كبير وملحوظ يمكن أن تظهر بعض الأعراض نتيجة إرهاق بعض أعضاء الجسم، ومن هذه الأعراض؛ الصداع، والدوخة، وعدم وضوح الرؤية، والغثيان، والتقيؤ، وألم الصدر، وضيق النفس، والضعف البدني، وتجدر الإشارة إلى أنه على المدى البعيد ينتج عن عدم السيطرة على ارتفاع ضغط الدم المزمن العديد من المضاعفات الصحية مثل؛ الجلطة القلبية، والسكتة الدماغية، والفشل الكلوي، وداء الشريان المحيطي، والفشل القلبي، وتلف العيون وفقدان البصر.",
      sources:
          '1- Benjamin Wedro (3-12-2018), "High Blood Pressure (Symptoms, Signs, Causes, Diet, Medication)", www.emedicinehealth.com, Retrieved 28-12-2018. Edited.\n2- LYNDA LAMPERT (5-8-2017), "Low Blood Pressure (Hypotension) Signs and Symptoms"، www.ausmed.com, Retrieved 28-12-2018. Edited.\n3- James Beckerman (5-9-2018), "High Blood Pressure in Children"، www.webmd.com, Retrieved 28-12-2018. Edited.\n4- Mayo Clinic Staff (5-12-2018), "High blood pressure in children"، www.mayoclinic.org, Retrieved 28-12-2018. Edited.\n5- Rachel Nall (20-3-2017), "A Mom’s Guide to Pediatric Vital Signs"، www.healthline.com, Retrieved 28-12-2018. Edited.\n6- Chris Woolston (20-1-2018), "High Blood Pressure During Pregnancy: Telltale Signs"، www.consumer.healthday.com, Retrieved 28-12-2018. Edited.\n7- "The 17 Best Foods for High Blood Pressure", www.healthline.com, Retrieved 4/26/2022. Edited.\n8- "High Blood Pressure Diet", www.webmd.com, Retrieved 4/26/2022. Edited.\n9- "Fifteen good foods for high blood pressure", www.medicalnewstoday.com, Retrieved 4/26/2022. Edited.\n10- " Hypertension and Nutrition", my.clevelandclinic.org, Retrieved 4/26/2022. Edited.\n11- "High Blood Pressure Prevention", www.webmd.com, Retrieved 4/26/2022. Edited.\n12- "Beating high blood pressure with food", www.health.harvard.edu, Retrieved 4/26/2022. Edited.\n',
      diseasesFood: highPressureFoodList),
  DiseasesAssets(
      id: 12,
      title: "أكلات تخلصك من الأرق",
      subtitle: "الأرق",
      image: "assets/images/diseases/insomnia.jpg",
      description:
          "يعود الأرق لأسباب عديدة، فهي مشكلة تتصل بجميع الاضطرابات التي تحصل مع الإنسان، فإن نوم الفرد يتأثر بكافة التغيرات النفسية والجسمية والبيئية داخل جسم الانسان وخارجه من هذه الأسباب كالآتي:\n- أسباب جسمية: مثل الأمراض الجسمية، والجوع، والشبع الزائد، وبرودة أو حرارة الغرفة.\n- أسباب نفسية: مثل الخوف أو التوتر والقلق أو الاكتئاب التي تؤدي إلى إعاقة دخول الفرد في حالة النوم بسبب التفكير الزائد.\n- أساليب التنشئة الخاطئة:من الأسباب المهمة لحصول مشكلة الأرق هي الأساليب الخاطئة في التربية أثناء فترة الطفولة فاتباع الأهل أسلوب الدلال الزائد، حيث يتعلق الطفل بالأم تعلق مرضي لا يستطيع النوم بعيدًا عنها وقد يؤثر ذلك على الفرد، ويسبب له مشاكل في النوم عندما يكبر ولكنه لا يكون واعيًا بالأسباب الحقيقية للأرق، وأيضًا اتباع أسلوب القسوة والعقاب البدني أو وجود خلافات في الأسرة وتفكك أسري، كل ذلك من الأسباب التي تؤدي إلى الأرق.",
      sources:
          '1 -  ستيفن دبليولوكلي، راسل فوستر (2015)، النوم (الطبعة الأولى)، القهرة-مصر: مؤسسة هنداوي للتعليم والثقافة، صفحة 83،84. بتصرّف.\n2-  أسامة مصطفى (2016)، مدخل إلى الاضطرابات السلوكية والانفعالية، عمان-الأردن: دار المسيرة، صفحة 184. بتصرّف.\n3-  أسامة مصطفى (2016)، مدخل إلى الاضطرابات السلوكية والانفعالية، عمان-الأردن: دار المسيرة، صفحة 192. بتصرّف.\n4-  بيتر هاوري، موري جارمن، شيرلي لايند (2001)، لا أرق بعد اليوم (الطبعة الأولى)، الرياض-المملكة العربية السعودية: مكتبة العبيكان، صفحة 44،45،46،47،48،49،53،54،55. بتصرّف.\n5-  أسامة مصطفى (2016)، مدخل إلى الاضطرابات السلوكية والانفعالية، عمان-الأردن: در المسيرة، صفحة 192،193. بتصرّف.\n',
      diseasesFood: insomniaFoodList),
  DiseasesAssets(
      id: 13,
      title: "أكلات للوقاية من الأنفلونزا",
      subtitle: "الأنفلونزا",
      image: "assets/images/diseases/flu.jpg",
      description:
          "تُعتبر الإنفلونزا واحدة من أكثر الأمراض المعدية انتشاراً في العالم، فهي من الأمراض التي تصيب الأجهزة التنفسية عند معظم الناس، ممّا يؤدي إلى إصابة المريض بالحمى، إلى جانب العديد من الأعراض، لا تقتصر الإصابة بمرض الإنفلونزا على فئة معينة من الناس دون الفئات الأخرى، حيث تصيب كافة أصناف الناس دون استثناء، إلا أنها قد تكون أكثر خطراً على الأفراد الذين تزيد أعمارهم عن خمس وستين عاماً تقريباً، بالإضافة إلى تشكيلها خطراً على الأشخاص الذين أصيبوا ببعض الأمراض المزمنة كمرض السكري، عدا عن النساء الحوامل، والسبب الرئيسي لمرض الإنفلونزا هو دخول الفيروس إلى جسم الإنسان. قديماً كان مرض الإنفلونزا واحداً من الأمراض الوبائية التي كانت تتسبب بموت المصابين، إلا أنه ومع التقدم الدوائي والعلاجي، واستطاع العلماء وذوو الاختصاص السيطرة عليها حتى أصبحت في يومنا هذا من الأمراض شبه الاعتيادية التي يمكن علاجها في أغلب الحالات بسهولة ويسر ودون أن تتسبب للناس بمضاعفات خطيرة كما كان يحدث في السابق.",
      sources:
          '1- "Expert Q&A: Can Your Diet Help You Avoid Flu?", webmd, Retrieved 14/7/2021. Edited.\n2- "How to Prevent the Flu: Natural Ways, After Exposure, and More", healthline, Retrieved 14/7/2021. Edited.\n3- "Foods That Help Prevent Colds and Flu", verywellfit, Retrieved 14/7/2021. Edited.\n4- "Foods That Help Prevent Colds and Flu", www.ncbi.nlm.nih.gov, Retrieved 14/7/2021. Edited.\n5- "Foods to eat and avoid with the flu", medicalnewstoday, Retrieved 14/7/2021. Edited.\n6- "15Foods That Boost the Immune System", healthline, Retrieved 14/7/2021. Edited.\n',
      diseasesFood: coldFoodList),
  DiseasesAssets(
      id: 14,
      title: "أكلات لنظارة البشرة",
      subtitle: "نظارة البشرة",
      image: "assets/images/diseases/skin.jpg",
      description:
          "إن الغذاء المتوازن مهم جداً للحصول على بشرة صافية، ويشتمل على الفواكه الطازجة والعصائر والخضروات الورقية الخضراء، كما ان إن شرب الكثير من الماء يخلص الجسم من السموم، ويرطب البشرة، لذلك هو مهم جداً في الحصول على بشرة صافية، ومشرقة، و من الجدير بالذكر ان عدم أخذ الكفاية من النوم يسبب مشاكل البشرة مثل الشحوب، وانتفاخ وسواد تحت العينين، أما الحصول على قسط كاف من النوم سوف يقلل من التجاعيد، ويزيد من صحة البشرة حول العينين، والحصول على بشرة صحية، ومشرقة.",
      sources:
          '1-  Taylor Jones (13-09-2018), "The 12 Best Foods for Healthy Skin"، www.healthline.com, Retrieved 25-01-2019. Edited.\n2-  Madeline R. Vann, "The Healthy Diet-Healthy Skin Link"، www.everydayhealth.com, Retrieved 25-01-2019. Edited.\n3-  Franziska Spritzler (24-04-2016), "11 Foods That Can Help You Look Younger"، www.healthline.com, Retrieved 25-01-2019. Edited.\n4-  Valencia Higuera (11-05-2017), "8 Benefits of Carrot Juice"، www.healthline.com, Retrieved 25-01-2019. Edited.\n5-  Madeline Vann, "The Healthy Diet-Healthy Skin Link"، www.everydayhealth.com, Retrieved 26-01-2019. Edited.\n',
      diseasesFood: skinFoodList),
  DiseasesAssets(
      id: 15,
      title: "أكلات لمرضى السكر",
      subtitle: "مرض السكر",
      image: "assets/images/diseases/diabetics.jpg",
      description:
          "الجسم يحطم الطعام الذي يتناوله الشخص إلى العناصر الغذائية التي يحتاجها الجسم؛ والتي من بينها سكر الجلوكوز، بحيث يتم امتصاصها فيما بعد عبر الجهاز الهضمي وإطلاقها إلى مجرى الدم، وعليه فإن مستويات الجلوكوز ترتفع في الدم بعد تناول وجبات الطعام، ممّا يُحفز البنكرياس لإنتاج هرمون الإنسولين وإطلاقه إلى مجرى الدم، ويجدر بالذكر أن هرمون الإنسولين يُمكّن الخلايا من استخدام الجلوكوز، وعليه فإن عدم توافر هذا الهرمون أو توافره بكميات أقل من حاجة الجسم يُبقي الجلوكوز في الدم بمستويات مرتفعة، ومن الجدير ذكره وجود ثلاثة أنواع رئيسية لمرض السّكري، النوع الأول والذي يكون فيه البنكرياس غير قادر على تصنيع الإنسولين، والنوع الثاني من السكري والذي لا يصنع فيه البنكرياس الإنسولين بكميات كافية أو لا تستجيب الخلايا للإنسولين على النحو اللازم بما يُعرف بمقاومة الإنسولين، أما النوع الثالث فهو سكري الحمل.",
      sources:
          '1- "diabetes", www.betterhealth.vic.gov.au, Retrieved March 6, 2020. Edited.\n2- "Type 2 diabetes mellitus: From a metabolic disorder to an inflammatory condition", www.ncbi.nlm.nih.gov, Retrieved April 19, 2020. Edited.\n3- "diabetes", www.who.int, Retrieved March 6, 2020. Edited.\n4- "Higher Prevalence of Type 2 Diabetes in Men Than in Women", academic.oup.com, Retrieved March 6, 2020. Edited.\n5- "Type 2 Diabetes: What Is It?", kidshealth.org, Retrieved March 6, 2020. Edited.\n6- "what is diabetes", www.niddk.nih.gov, Retrieved March 6, 2020. Edited.\n',
      diseasesFood: diabeticsFoodList),
  DiseasesAssets(
      id: 16,
      title: "أكلات مريحة للمعدة",
      subtitle: "المعدة",
      image: "assets/images/diseases/indigestion.png",
      description:
          "تعد المعدة أحد أجزاء الجهاز الهضمي المسؤولة عن استلام الطعام من المريء، وتخزينه وتكسيره وهضمه، ثم إرساله إلى أول جزء من الأمعاء الدقيقة، وهو الاثني عشر. \nوبمجرد أن يدخل الطعام إلى المعدة، تنفتح المصرات في فتحة المعدة وتغلق في منطقة الخروج إلى الأمعاء الدقيقة، تفرز بطانة المعدة أحماض الهيدروكلوريك والإنزيمات التي تعمل على تكسير الطعام حتى يتمكن من الاستمرار في رحلته عبر الجهاز الهضمي. عندما يُفرز الحمض والإنزيمات، تنقبض عضلات المعدة في عملية تسمى التمعّج أو الحركة الدودية لخلط الطعام مع الحمض والإنزيمات.\nوتتأثر فترة بقاء الطعام في المعدة على نوعية الوجبة، وعادةً ما تتراوح بين 3-6 ساعات. وتبقى الكربوهيدرات أقل مدة في المعدة، تليها البروتينات. أما الدهون فيستغرق هضمها أطول مدة في المعدة. ",
      sources:
          '1- Louisa Richards (3-6-2020), "What are the best foods for an upset stomach?"، www.medicalnewstoday.com, Retrieved 4-8-2020. Edited.\n2- "What to Eat (or Not) When Your Stomach Hurts", www.webmd.com,14-5-2019، Retrieved 4-8-2020. Edited.\n3- Reena Khanna, John MacDonald And Barrett Levesque (7-2014), "Peppermint oil for the treatment of irritable bowel syndrome: a systematic review and meta-analysis", Journal of Clinical Gastroenterology, Issue 6, Folder 48, Page 505-512. Edited.\n4- Erica Julson (16-5-2018), "The 12 Best Foods for an Upset Stomach"، www.healthline.com, Retrieved 4-8-2020. Edited.\n5-Michael J. Watson (30-7-2018), "List of Healthy, Easy to Digest Foods"، www.doctorshealthpress.com, Retrieved 2-6-2019. Edited.\n6- MaryAnn de Pietro (7-11-2017), "10 foods that are easy to digest"، www.medicalnewstoday.com, Retrieved 2-6-2019. Edited.\n7- Erica Julson, MS, RDN, CLT (16-5-2018), "The 12 Best Foods for an Upset Stomach"، www.healthline.com, Retrieved 2-6-2019. Edited.\n',
      diseasesFood: stomachFoodList),
  DiseasesAssets(
      id: 17,
      title: "أكلات لمحاربة الامساك",
      subtitle: "الامساك",
      image: "assets/images/diseases/constipation.jpg",
      description:
          "يبدأ علاج الإمساك عادةً بإجراء بعض التغييرات اللازمة لتسهيل حركة البُراز في الأمعاء وتسريعها، وذلك من خلال اتباع نمط حياة صحي، ومن النصائح التي قد يعطيها الطبيب للمصاب الذي يعاني من الإمساك:\n1- الإكثار من تناول الألياف نظراً لدورها في تكبير حجم البراز وتسريع عبوره في الأمعاء، فيبدأ المصاب بتناول كميات محددة من الخضار والفواكه الطازجة يومياً، وكذلك حبوب القمح أو الخبر كامل الحبوب، ويجدر التنويه إلى أن تناول الألياف بمكيات كبيرة بشكل مفاجئ سيؤدي إلى الإصابة بالانتفاخ وتكون الغازات، لذلك من الضروري أن يكون إدخال الألياف إلى النظام الغذائي ببطء وبكميات مدروسة.\n2- عدم إهمال الحاجة للإخراج وأخذ الفترة الزمنية الكافية لإخراج الفضلات دون الاستعجال أو صرف الانتباه.\n3- ممارسة التمارين الرياضية معظم أيام الأسبوع، وذلك لأن الحركة تزيد من النشاط العضلي في الأمعاء، وعليه فإنه من الضرورة مشاورة الطبيب المعالج بالحالة الصحية العامة للمصاب إن كانت تسمح له بممارسة الرياضة والمباشرة بها فور وضع البرنامج المناسب.\n4- الإكثار من شرب الماء لتجنب الجفاف.\n5- رفع القدمين على مقعد صغير أثناء استخدام المرحاض بحيث ترتفع الركبتين فوق مستوى الحوض فيتسهل بذلك خروج الفضلات.",
      sources:
          '1- "Treatment for Constipation", www.niddk.nih.gov, Retrieved Jan.03.2020. Edited.\n2- "Constipation", www.mayoclinic.org, Retrieved Jan.03.2020. Edited.\n3- "Constipation", www.nhsinform.scot, Retrieved Jan.03.2020. Edited.\n4- "Laxatives for constipation: All you need to know", www.medicalnewstoday.com, Retrieved Jan.03.2020. Edited.\n',
      diseasesFood: constipationFoodList),
  DiseasesAssets(
      id: 18,
      title: "أكلات لمحاربة الاسهال",
      subtitle: "الأسهال",
      image: "assets/images/diseases/diarrhea.jpg",
      description:
          "يُشفى المصاب بالإسهال خلال وقت قصير من تلقاء نفسه في العادة دون الحصول على علاج دوائي، ولكن في بعض الحالات قد يحتاج المصاب للحصول على علاجات دوائية لحالته، خاصة إذا لم يتحسن أو ازدادت أعراضه سوءاً مع مرور الوقت، ومن الأمور المفيدة في وقف الإسهال أو تخفيف أعراضه ومنع تفاقمها: تعديل النظام الغذائي والإكثار من شرب السوائل والمحاليل الفموية لتعويض السوائل المفقودة.",
      sources:
          '1- "Diarrhea in Children", www.hopkinsmedicine.org, Retrieved 6-11-2019. Edited.\nn2- "Diarrhea", www.mayoclinic.org, Retrieved 6-11-2019. Edited.\n3- "Acute Diarrhea in Adults", www.aafp.org, Retrieved 10/11/2019. Edited.\n4- "Solutions: The most effective, least expensive way to manage diarrhoeal dehydration", www.rehydrate.org, Retrieved 10/11/2019. Edited.\n',
      diseasesFood: diarrheaFoodList),
];
