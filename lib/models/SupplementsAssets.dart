import 'package:flutter/material.dart';

class SupplementsAssets {
  int id;
  final String name, image, desc, benefits, dosage, types;
  final Color color;

  SupplementsAssets(
      {required this.id,
      required this.name,
      required this.image,
      required this.desc,
      required this.benefits,
      required this.dosage,
      required this.types,
      required this.color});
}

List<SupplementsAssets> supplementsList = [
  SupplementsAssets(
      id: 1,
      name: "واي بروتين",
      image: "assets/images/supplements/wheyProtein.png",
      desc: '''
الواي بروتين هو مكمل غذائي طبيعي مستخرج من الحليب البقري بعد مرحلة تصنيع الجبن وإستخلاص الدهون. حتى أن الأسماء الأخرى للواي بروتين هي بروتين مصل اللبن أو بروتين شرش اللبن.\n
والواي بروتين يباع تجارياً فى شكل مسحوق  (بودرة)، بنكهات مختلفة مثل الشيكولاتة و الفانيليا و الفراولة..الخ. ومعظم الأنواع تكون منخفضة الكاربوهيدرات والدهون.
''',
      benefits:
          "يعتبر الواي بروتين مصدر غني و مهم للبروتين وهو يحتوي كذلك على أهم الأحماض الأمينية التي يحتاجها جسم الإنسان، خاصة ممارس رياضة كمال الأجسام.\nو يمتاز أيضا الواي بروتين بخاصية سرعة الإمتصاص، حيث يسهل على الجسم امتصاصه وتفكيكه بكفاءة وسرعة عاليتين مقارنة مع باقي مصادر البروتين الأخرى.\nكما ان الواي بروتين بديلا ممتازا و غنيا للبروتين لمن يرغب في تعويض بعض من حاجيات جسمه اليومية من البروتين، ويعتبر الواي بروتين مكمل آمن، ولا يشكل أي أضرار تذكر على صحة الإنسان بل بالعكس، فوائده عديدة و يحتوي على قيم غذائية عالية تساعد الجسم.",
      dosage:
          "الجرعة التي ينصح باستهلاكها يوميا من الواي بروتين هي 2 سكوبات (السكوب هي الملعقة التي تكون وسط المكمل)  أو ما يعادل 25 إلى 60 غرام.\nويفضل دائما التقيد بإرشادات المصنع، فكل مكمل يحمل ملصقا يوضح الكمية التي ينصح بعدم تجاوزها مع طريقة استخدامه.\nاغلب منتجات الواي بروتين هي عبارة عن بودرة، يتم خلطها مع السوائل، لذا يمكن اضافة الواي بروتين مع الماء أو عصير الفواكه او أي سائل من اختيارك، ويتم إذابة 1 سكوب (السكوب هو الملعقة التي تكون وسط المكمل) في ما يعادل 200- 250 مللتر مع أي سائل من اختيارك.",
      types: '''
هناك ثلاث أنواع أساسية من الواي بروتين:
Whey Protein Isolate
Whey Protein Concentrates
 Whey Protein Hydrolised
 فالواي بروتين يمر بعدة مراحل لتصفية وإزالة النشويات والدهون واللاكتوز (سكر الحليب) والشوائب من الحليب البقري.
فالواي بروتين كونسنتريت Concentrates يكتكون من 80% من البروتين والآيزوليت Isolates من 90% بروتين. ولا يوجد أى اختلافات جوهرية أخرى.
أما الـ Hydrolised واي بروتين أو ما يسمى هيدرو واي، فيتم تكسيره جزئياً في المصنع، فيما يشبه عملية هضم جزئية، حتى يصبح أسهل هضماً و أسرع امتصاصاً.''',
      color: Color(0xFFC26663)),
  SupplementsAssets(
      id: 2,
      name: "كرياتين",
      image: "assets/images/supplements/creatine.png",
      desc:
          "يعتبر الكرياتين من المكملات الغذائية الأساسية التي يعتمد عليها الكثير من اللاعبين الرياضيين وخاصة لاعبي كمال الأجسام، وهو حمض نيتروجيني يتم تصنيعه في داخل الجسم في الكبد؛ حيث إنّه يتكون من ثلاثة أحماض أمينية وهي الأرجنين، والجلايسين، والميثيونين؛ وينتقل هذا الحمض من الكبد إلى كافة خلايا الجسم من خلال الدم لإمدادها بالطاقة، وتعتبر العضلات والمخ من أكثر الأعضاء التي تستفيد منه، و من الصعب الحصول على الكرياتين من خارج الجسم لأنه يتطلب تناول كميات كبيرة من الأسماك واللحوم الحمراء، حيث يحتوي الكيلوغرام منها على خمسة غرامات من الكرياتين.\nوهناك شائعات ان الكرياتين مضر لأنه يحبس المياه في الجسم ولكن هذا المفهوم خاطئ , حيث ان الكرياتين يخزن مياه داخل العضلة و بتالي يزيد من قوة وحجم العضلة, وتم اجراء العديد من الاختبارات على هذا المكمل و تم اثبات انه امن تماما.",
      benefits: '''
١- زيادة القوة: يمكن أن يساعد استهلاك الكرياتين عضلاتك على بناء الفوسبوكرياتين، والذي يمنحك القدرة على أداء أفضل في التمارين الرياضة.\n
2- تحسين الأداء: اكتشف باحثون إيطاليون أن لاعبي القفز والعدائين الذين تناولوا مكملات الكرياتين قد تحسنوا بشكل ملحوظ أول 30 ثانية من أدائهم بنسبة 10% تقريبا.\n
3- زيادة الحدة الذهنية: إلى جانب التحسينات التي طرأت على الأداء البدني، فقد ثبت أيضا أن الكرياتين يحسن حدة العقل.\n
حيث أعطى باحثون أستراليون 45 مشاركا في الدراسة خمسة غرامات من مكملات الكرياتين يوميا لمدة ستة أسابيع، ووجدوا أن العديد من المشاركين عالجوا المعلومات بسرعة أكبر وأظهروا تحسنا في الذاكرة.\n
4- تعزيز الإنتاجية: قد يساعد الكرياتين في تحسين إنتاجيتك، وفقا لباحثين بريطانيين. تمكن راكبو الكاياك الذين تلقوا مكملات الكرياتين من إنجاز المزيد من العمل في التجديف، مما يشير إلى أن الكرياتين يوفر أداء معززا للنشاط البدني.\n
5- تعظيم نمو العضلات: يعد استهلاك البروتين أمرا بالغ الأهمية لنمو العضلات - ربما كنت تعرف ذلك بالفعل. لكن الكرياتين يمكن أن يساعد أيضا، وفقًا لباحثي جامعة ولاية واشنطن. توصلت دراستهم إلى أن الأشخاص الذين استكملوا التدريبات بالكرياتين تمكنوا من اكتساب كتلة عضلية كبيرة.''',
      dosage: '''
هناك أكثر من طريقة لتناول الكرياتين, مما يسبب بعض الحيرة لدي اللاعبين حول أفضل طريقة لتناوله.
1- تحميل الكرياتين (CREATINE LOADING) : من أشهر الطرق لاستخدام الكرياتين هي طريقة التحميل. 
حيث تقوم بملئ مخازن العضلات بالكرياتين بسرعة, ثم تنتقل لمرحلة ال Maintenance Phase حيث تتناول جرعة أقل للمحافظة علي مستوي الكرياتين في العضلات.
 يتم تحميل الكرياتين عن طريق تناول 20 جرام يوميا مقسمين الي 4 جرعات, كل جرعة 5 جرام, وتستمر مرحلة التحميل لمدة أسبوع والهدف منها هو تشبع العضلات بالكرياتين بسرعة.
 بعد ذلك الإسبوع تنتقل لل Maintenance Phase حيث تتناول من 3-5 جرام يوميا لتحافظ علي نسبة الكرياتين في العضلات.
تزيد طريقة تحميل الكرياتين من احتمالية حدوث آثارجانبية مثل الإنتفاخ وآلام المعدة, لذلك يفضل بعض الأشخاص تحميل الكرياتين علي مدار مدة أطول 10-14 يوم, حيث تتناول 10 جرام فقط يوميا أثناء فترة التحميل ويساعد ذلك علي خفض فرص حدوث آثار جانبية.\n
2- بدون فترة تحميل: للحد من الآثار الجانبية تماما, يمكنك استخدام الكرياتين بدون تحميل وتناول 5 جرام يوميا منذ البداية.
سيؤدي ذلك لارتفاع مستوي الكرياتين في العضلات ولكن ببطئ وستصل الي التشبع العضلي أيضا ولكن في خلال مدة أطول. 
دراسة أجريت عام 1996 أثبتت أن تناول 3 جرام كرياتين يوميا يؤدي الي تشبع العضلات بعد 28 يوم, مما يعني أنك ستتمتع بنفس فوائد الكرياتين ولكن بعد مدة أطول قليلا ( شهر بدلا من أسبوع), لذلك ننصحك بتناول الكرياتين بدون فترة تحميل للحد من احتمالية تعرضك للآثار الجانبية, ابدأ بتناول 5 جرام يوميا (ملعقة صغيرة) واستمر علي هذه الجرعة.''',
      types:
          "1- كرياتين مونوهيدرات Creatine Monohydrate\nهو المادة الخام للكرياتين يكون على شكل بدرة بيضاء ، ويعتبر من أرخص أنواع كرياتين والأكثر فاعلية، و يعتبر هذا النوع هو الأكثر استخداماً في التجارب والأبحاث التي أجريت على هذا المكمل.\n2- كرياتين الميكرونيزد Creatine Micronized\nالكرياتين الميكرو نيزد هو نفسه المونوهيدرات ولكنه مصغر بصورة أكبر في شكل بدرة Powder صغيرة جدا وأسهل في الذوبان في الماء ، ولكن هذا لا يعني انه سريع الامتصاص في الدم والعضلات.",
      color: Color(0xFF96C970)),
  SupplementsAssets(
      id: 3,
      name: "جينير",
      image: "assets/images/supplements/massGainer.png",
      desc:
          "هذا المكمل فعال جدا لمن يرغبون في التضخيم و يمتلكون معدل حرق عالي و يجدون صعوبة في تناول وجبات كبيرة من الأكل، حيث يوفر هذا المكمل كميات كبيرة من السعرات الحرارية، القادرة على مساعدته على زيادة وزنه وبناء كتلة عضلية, اما بالنسبة للأشخاض الذين يمتلكون معدل حرق متوسط او منخفض فيفضل لهم استخدام whey protein تجنبا لزيادة الدهون مع الكتلة العضلية.",
      benefits:
          "يعد مكمل ماس جينر من المكملات الغذائية الغنية بالبروتين النقي حيث يمد جسمك بـ 52 جرام من البروتين الذي يساعد على اكتساب كتلة عضلية جيدة، بالإضافة لكونه يحتوي على العديد من الأحماض الأمينية المفيدة في عملية بناء و نمو العضلات.\nويحتوي ايضا على أكثر من 10 جرام bcaas التي تساهم في تقليل التعب البدني والعقلي من خلال التخفيف من ألام العضلات الذي تشعر به بعد التمارين الشاقة.",
      dosage:
          "يتم استهلاك ملعقتين من هذا المكمل يوميا، وتخلط كل ملعقة مع الحليب الخالي الدسم أو الماء من 200 إلى 250 ميليلتر، و يمكنك استهلاك الملعقة الأولى قبل التمرين الرياضي بساعة والملعقة الثاني مباشرة بعد التمرين.",
      types:
          "يوجد العديد من انواع مكمل الماس جينير و منها:\n1. مكمل Optimum Nutrition Serious Mass\nقد يجذب هذا المنتج الأشخاص الذين يرغبون في زيادة الوزن وإضافة الفيتامينات والمعادن الأساسية إلى نظامهم الغذائي, و من الجدير بالذكر ان نسبة البروتين إلى الكربوهيدرات هي 1: 5، لذلك قد لا تناسب الأشخاص الذين يريدون المزيد من البروتين والسعرات الحرارية القليلة.\n2. مكمل Transparent Labs Mass Gainer\nإن تركيز بروتين مصل اللبن في هذا المكمل الشامل هو 100 ٪ يتغذى على العشب، وتشمل الكربوهيدرات الشوفان العضوي التابيوكا والبطاطا الحلوة. كما يحتوي على كرياتين مونوهيدرات ومحليات طبيعية.\n3. مكمل Vegan Naked Mass\nهذا المكمل مفيد للنباتيين الذين يرغبون في زيادة الوزن والعضلات، ويقارن بشكل جيد مع مكملات الماس جينر الأخرى في السوق. كما أنه خالي من الجلوتين وفول الصويا.\n4. مكمل True-Mass 1200\nيحتوي على الدهون الثلاثية متوسطة السلسلة و BCAAs و يتميز مكمل True-Mass 1200 بنسبة 4: 1 من الكربوهيدرات إلى البروتين ويحتوي أيضًا على الدهون الصحية.",
      color: Color(0xFF98CD76)),
  SupplementsAssets(
      id: 4,
      name: "كازيين",
      image: "assets/images/supplements/casein.png",
      desc:
          "يتواجد بروتين الكازين (بالإنجليزية: Casein)، أو ما يعرف أيضاً بالجبنين في حليب البقر، حيث يشكل بروتين الكازين في الحليب 80% من إجمالي البروتينات المتواجدة فيه، ويتواجد هذا البروتين في اللبن أيضاً ويعد من مصادر البروتين عالية الجودة، وذلك لأنه يحتوي على جميع الأحماض الأمينية الأساسية التي يحتاج الجسم إلى أن يحصل عليها من الطعام بسبب عدم قدرته على تصنيعها بنفسه، بالإضافة إلى سهولة هضم وامتصاص الكازين من قبل الجسم.\nو يتميز بروتين الكازين بشكل رئيسي بامتصاصه بشكل بطيء من قبل الجسم مقارنة ببروتين مصل اللبن أو الواي بروتين (بالإنجليزية: Whey protein)، وهو أحد أنواع البروتينات الأخرى الموجودة في الحليب، حيث يتم طرح وإطلاق الأحماض الأمينية من بروتين الكازين بشكل بطيء بحيث يستمر ذلك لفترات طويلة من الزمن ودون انقطاع.",
      benefits:
          "فوائد الكازين ناتجة عن بطء امتصاصه وبطء طرحه وإطلاق الأحماض الأمينية منه، يزيد من مساهمته في تغذية خلايا الجسم باستمرار وذلك لفترات طويلة من الزمن. \nبالتالي يمكن أن يساعد الخلايا العضلية على الاستمرار في تكوين البروتين و الاستفاده منه خلال فترة النوم, او خلال فترة الصيام.",
      dosage:
          "المكيال عبارة عن 30 جرام بهم 25 جرام بروتين و120 سعر حراري والقليل من الدهون والكارب (حسب المنتج). تناول مكيال ونصف أو مكيالين قبل النوم، يتم إذابتها في المياه أو الحليب لا فارق، ولكني أنصح بإذابتها في الحليب واستخدام سكر دايت لأن الكازين طعمه غير مستحب.\nلا مشكلة في تناوله بعد تمارين الحديد وبين الوجبات وتأثيره على بناء العضلات نفس تأثير الواي بروتين.",
      types:
          "النوع الأساسي والخام هو Micellar casein وهو النوع بطيء الامتصاص.\nالنوع الثاني هو هيدروليزد كازين، وهو نوع يتم تكسير البروتين فيه جزئياً عن طريق إنزيمات، بحيث يكون سريع الامتصاص،  ولا أرى أي فائدة له عن الواي البروتين. هو مجرد بروتين سريع الامتصاص أغلى سعراً من الواي وغير شائع. حتى أن هناك دراسة  وجدت أن الواي بروتين يساعد على خسارة الدهون بشكل أفضل.",
      color: Color(0xFF466FCA)),
  SupplementsAssets(
      id: 5,
      name: "BCAA",
      image: "assets/images/supplements/bcaa.png",
      desc:
          "بالرغم من الشهرة والأقبال الكبير علي ذلك النوع من المكملات إلي أنه أثبتت الكثير من الدراسات والأبحاث, أن مكمل BCAA لا يضيف أي جديد للجسم أو للعضلات بشكل كبير إذا كنت تتناول كمية البروتين التي يتطلبها الجسم في اليوم كاملة وبتقسيمها علي وجباتك في اليوم فلا حاجة لشراء هذا المكمل لتوفير المال لشراء مكملات اكثر اهمية مثل الواي بروتين و مكمل الكرياتين.\nو لكن يمكن استخدام هذا المكمل اذا كنت مما يسعون لاحتراف لعبة كمال الاجسام والاشتراك في المسابقات لأنك تحتاج لكل ١ % من الاسباب التي تقربك لهدفك والفوز في المسابقة.",
      benefits:
          "أولاً له دور في زيادة معدل التعافي أو الاستشفاء العضلي وبذك يزيد من معدل أستجابة الجسم للتمرين الرياضي والأستفادة منه.\nثانياً يحافظ علي كمية الكتلة العضلية المتكونة أي أنه يجعل الجسم يحافظ علي حجم هذه العضلات ولا تتأثر أو يتم أستهلاكها خلال فترات الصيام الطويلة, وأيضا في حالة إتباع نظام دايت فقير من البروتين.\nثالثاً وهذه من أهم الفوائد له أنه عند تناول مكمل ال BCAA يحفز عملية تخليق البروتين ونعني بذلك أنه يحفز الانسجة والعضلية وخلايا العضلات لجسمك علي إنتاج البروتينات مما يترتب علي ذلك زيادة معدل نمو الانسجة العضلية عن المعدل الطبيعي.\nرابعاً يقلل من الأجهاد أثناء اداء التمرين أي أنه يزيد من قوة تحملك.",
      dosage:
          "تتواجد مكملات BCAA بشكلين هما المساحيق وكبسولات ، ويتم تناولها 3 مرات في اليوم وذلك اعتماداً على حجم الحصة الواحدة من المكمل، ويمكن تناول المكمل عبر مزج  المسحوق بالماء أو بالمشروبات الرياضية وتناوله خلال التمرين، أمّا الكبسولات يمكن بلعها كاملة مع كوب من الماء.",
      types:
          "يأتي مكمل الbcaa في ثلاثة اشكال:\n1- كبسولات BCAA: الكبسولات مريحة ولكنها بطيئة نسبياً.\n2- مسحوق  BCAA: البودر أو البدرة التي يتم أخذها في التمرين فعالة للغاية لأنها تعطيك الطاقة الفورية وتعزز استشفاء العضلات بشكل أسرع.\n3-  BCAA Liquid: الأحماض الأمينية في شكل سائل هي الأسرع للامتصاص في الدم.",
      color: Color(0xFF8AB949)),
  SupplementsAssets(
      id: 6,
      name: "زيت السمك",
      image: "assets/images/supplements/fishOil.png",
      desc:
          "حبوب زيت السمك هي مكمل غذائي يعتبر مصدر للأوميجا 3، وهو نوع من الأحماض الدهنية الأساسية وغير المشبعة والتي لا يمكن للجسم أن يصنعها بنفسه، بل يستمدها من مصادر خارجية, وتعد أحد الدهون الصحية التي يمكن أن تساعد على حماية الجسم على مختلف الأصعدة وأهمها صحة القلب والدماغ.",
      benefits:
          "1 - خفض ألم العضلات والتهابات المفاصل : توفر دهون أوميجا 3 العديد من الفوائد للاعبي كمال الأجسام ولعضلات الجسم والمفاصل، نظراً لقدرتها المضادة للإلتهابات. يشعر بعض الأشخاص بالتهابات أو آلام في العضلات والمفاصل بعد التمارين الرياضية بحوالي 12-72 ساعة، هذا الألم قد يكون ناجم عن التهاب في ألياف العضلات أو المفاصل، وهنا يأتي دور أوميجا 3 حيث أنها تساهم في تقليل تلك الإلتهابات، وبالتالي تقلل من شعورك بهذا الألم.\n2- تحسين الأداء التدريبي وزيادة القوة: الأحماض الدهنية الموجودة في زيت السمك تساهم في تحسين الأداء التدريبي بشكل كبير، وذلك لأنها تقلل من فرصة فقدان القوة خلال التمارين الرياضية، بالإضافة إلى انها تحسن من النشاط الذهني، والتركيز وهو ما له دور ايضا في زيادة نشاط وقوة الأداء الحركي.\n3- تحسين الأداء الحركي: دهون أوميجا 3 تساهم في تحسين صحة المفاصل وتساهم في تحسين الأداء الحركي خلال التمارين الرياضية، وكذلك تقلل من فرصة إصابة المفاصل والعظام خلال التمارين الرياضية، أو خلال الأنشطة اليومية التي تتطلب نشاط بدني.\n4 - حماية القلب والأوعية الدموية: دهون أوميجا 3 لها دور كبير في الحفاظ على صحة القلب، ولها دور كبير في تحسين الدورة الدموية وتحسين صحة الأوعية الدموية، كما أنها تزيد من الكوليسترول الجيد HDL، مقابل انها تخفض من الكوليسترول الضار LDL وهو الذي تسبب زيادة مستوياته في الجسم لعدد من المشاكل، مثل خطر الاصابة بتصلب الشرايين، وانسداد الاوعية الدموية، والازمات القلبية.",
      dosage:
          "الجرعات الآمنة من أوميجا 3 والتي تم الاستقرار عليها هي 5000 ملغ ولا يفضل أن تتعدى تلك الجرعة، فهي جرعة مناسبة لتحسين وظائف القلب والدماغ، وكذلك للحصول على فوائدها مثل زيادة قوة الجسم، والتقليل من التعب في التمارين الرياضية.",
      types: "",
      color: Color(0xFFFF8353)),
  SupplementsAssets(
      id: 7,
      name: "جلوتامين",
      image: "assets/images/supplements/glutamine.png",
      desc:
          "الجلوتامين Glutamine يعد حمضًا أمينيًّا يقوم الجسم بإنتاجه بشكل طبيعي، وهو من أكثر الأحماض الأمينية توفرًا في الدم والسوائل الأخرى، ولكن قد يكون هناك حاجة لاستخدام مكملات الجلوتامين، إذا لم يستطع الجسم إنتاجه بالكمية الكافية، ويعد من المكملات الغير الاساسية الذي يمكن الاستغناء عن شرائها في مقابل شراء مكمل الواي بروتين او الكرياتين.",
      benefits:
          "1- قد يساعد في تعزيز نمو العضلات.\n2- قد يحسن من الأداء الرياضي.\n3- قد يساعد في شفاء العضلات بعد التمارين القاسية.\n4- قد يقلل من الأمونيا أثناء ممارسة تمارين التحمل.",
      dosage:
          "إذا كان الشخص يريد تناول مكملات الجلوتامين بهدف زيادة الأداء الرياضي وبناء العضلات لكمال الأجسام، فيجب عليه تناول جرعة محددة تتراوح ما بين 20-30 غرامًا في اليوم، كما هناك آراء أخرى تقول بأنه يجب تناول 0.3- 0.5 غم/ كغم من وزن الجسم كل يوم.",
      types: "",
      color: Color(0xFF29292C)),
  SupplementsAssets(
      id: 8,
      name: "ل-ارجنين",
      image: "assets/images/supplements/arginine.png",
      desc:
          "الارجنين هو احد الاحماض الامينية التي يحتاج إليها الجسم وهو حمض أميني شبه أساسي، تنقسم الأحماض الأمينية إلى قسمين هما الاحماض الاساسية والاحماض الغير اساسية وايضا الاحماض الشبه اساسية.\nالاحماض الشبه اساسية مثل الارجنين هي التي في الوضع الطبيعي يقوم الجسم بتصنيعها ولكن في حالات معينة قد لا يستطيع الجسم صنعها وينبغي ان تحصل عليها من خلال الطعام.\nيتواجد حمض الارجنين في مصادر البروتين المختلفة سواء كانت النباتية أو الحيوانية مثل اللحوم والاسماك والبيض وايضا البقوليات والحبوب الكاملة، ويتم استخدام مكملات ل- ارجنين للرياضيين أو لبعض الحالات التي تحتاج إلى الارجنين من مصدر خارجي.",
      benefits:
          "1- زيادة المكاسب العضلية.\n2- خفض الكوليسترول الضار LDL.\n3- زيادة قوة التحمل والاستشفاء العضلي.\n4- مفيد في خسارة الوزن والتنشيف.",
      dosage:
          "ينبغي ان يكون استخدام مكمل ل-ارجنين بحرص شديد لان الزيادة في نسبة الارجنين التي تحصل عليها قد يكون له آثار جانبية، لذلك من الأفضل ان تبدأ باستخدام جرعات خفيفة لمدة اسبوع ومن ثم زيادة الجرعة بشكل تدريجي.",
      types: "",
      color: Color(0xFFFF971D)),
  SupplementsAssets(
      id: 9,
      name: "بيتا الانين",
      image: "assets/images/supplements/alanine.png",
      desc:
          "بيتا ألانين هو حمض أميني غير أساسي، مما يعني أنه يُصنع في الجسم.\nفي حين أن معظم الأحماض الأمينية تشكل اللبنات الأساسية للبروتين، إلا أن بعضها - مثل بيتا ألانين - يخدم وظائف أخرى داخل الجسم و هي انه يساعد على تكوين الكارنوسين.\nوالكارنوسين هو مركب يتكون من بيتا ألانين والهستيدين و يساعد على تقليل حموضة الخلايا, وعندما يقلل الكارنوسين حموضة الخلايا يؤدي ذلك الى تأخر التعب والأرهاق , وبالتالي سوف تلاحظ زيادة في الإنتباه والنشاط اثناء التمرين مع تأخر الشعور بالارهاق.",
      benefits: '''
- يساعدك على التمرين بأقصى طاقة لك لأطول فترة ممكنة.
- بيتا الانين يحتوي على نسبة عالية جدا من مضادات الأكسدة, وهي مواد تحارب الجذور الحرة في الجسم، وتمنع أو تبطئ تلف الخلايا الناتج عن الجذور الحرة والجزيئات غير المستقرة في الجسم. وتلعب مضادات الأكسدة دوراً في محاربة علامات الشيخوخة.
- يقلل من تكوين حمض الاكتيك داخل العضلات, وحمض الاكتيك هو المادة التي تجعلك تشعر بألم شديد في العضلات أثناء التمرين.
- يعتبر بيتا الانين مهم أيضا في الرياضات الهوائية فهو يساعد على زيادة السرعة و القوة والتحمل, اذاً فهو مكمل مهم للرياضيين بشكل عام سواء رياضة كمال الاجسام او الرياضات الهوائية.
- يساعد على زيادة استخدام الأكسجين, وبالتالي يزيد من معدل حرق الدهون.''',
      dosage:
          "عندما يتعلق الأمر بالجرعة المثلى، يُقترح تناول 2-6 غرام حيث تعتبر تلك هي الجرعة الأكثر فائدة للأفراد النشطين.",
      types: "",
      color: Color(0xFF312F30)),
  SupplementsAssets(
      id: 10,
      name: "فيتامينات",
      image: "assets/images/supplements/opti-man.png",
      desc:
          "opti-man هو مكمل غذائي للرجال وخاصة لاعبي كمال الاجسام يمد جسم الانسان بالمعادن والفيتامينات التي تساعد على نشاط الجسم ، تساعد هذه الفيتامينات في تكسير الطعام من العناصر الغذائية الأكبر، مثل الكربوهيدرات والأحماض الدهنية، إلى وحدات أصغر يمكن أن يستخدمها الجسم لتحويل الطعام إلى وقود.",
      benefits:
          "- به انزيمات تساعد على عملية الهضم.\n- يزيد من نسبة امتصاص الكالسيوم داخل الجسم.\n- ينشط و يقوي الجهاز المناعي.\n- يساعد الجسم على تحطيم الكربوهيدرات للحصول على الطاقة.\n- يحافظ على صحة القلب.\n- يساهم في نمو خلايا الجسم، وإنتاج كريات الدم الحمراء.\n- يحافظ فيتامين على صحة خلايا الدماغ.\n- يساعد الجسم على تحطيم الغذاء للحصول على الطاقة.\n- يحافظ على صحة الجهاز العصبي.\n- يساعد فيتامين ج في بناء العظام وإنتاج الكولاجين.",
      dosage:
          "يتم اخذه ثلاث مرات يوميا عن طريق قرص أثناء وجبة اللإفطار وقرص مع الغداء و قرص مع العشاء.",
      types: "",
      color: Color(0xFFF6D636)),
  SupplementsAssets(
      id: 11,
      name: "حوارق الدهون",
      image: "assets/images/supplements/fatBurner.png",
      desc:
          "تحتوي حوارق الدهون على بعض المكونات التي تحرض مجموعة من الأفعال الهرمونية في الجسم، والتي تسبب تحطم الدهون واستخدامها كمصدر للطاقة، ويعد الكافيين المكون الأساسي في معظم حارقات الدهون حيث يساعد على خسارة الوزن عبر زيادة معدل استقلاب الدهون ومساعدة الجسم ليستخدمها كمصدر للطاقة وبالتالي تساعد هذه الطاقة على تحسين الاداء الرياضي وحرق المزيد من السعرات الحرارية.\nأهم شيء تحتاج إلى معرفته حول أخذ هذه الأنواع من المكملات الغذائية المعروفة باسم حوارق الدهون، هو أنه لا يجب عليك أبدا استخدامها لفترات طويلة من الزمن.\nو من اضرارها زيادة ضربات القلب، زيادة ضغط الدم، زيادة التوتر، الارق، وفوائدها في خسارة الوزن لا تتعدى 10% من النتيجة النهائية لذالك يمكن الاستغناء عنها و التركيز على الدايت والتمارين الرياضية.",
      benefits: '''
- الرفع من معدل الأيض : تزيد من نسبة التمثيل الغذائي وتجعل الجسم يحرق المزيد من السعرات الحرارية.
- مد الجسم بالطاقة : تساعد على تزويد الجسم بالطاقة بفضل احتوائها على عنصر الكافيين، مما يسهل أداء التمارين الرياضية، ويمنع الخمول الناتج عن نقص الكربوهيدرات في النظام الغذائي.
- تقليل الشهية : من المشاكل التي يواجهها الأشخاص المقبلين على فقدان الوزن هو الشهية المفتوحة للأكل، لذلك تستعمل مكملات حرق الدهون لغرض الحد من الشهية المفرطة وزيادة الشعور بالشبع لفترات طويلة.
- التخلص من السوائل : تعمل حوارق الدهون أيضا على إزالة الماء من الجسم، مما يؤدي إلى فقدان سريع في الوزن.''',
      dosage:
          "يؤخذ مرتين يوميا، الأولى في الصباح على معدة فارغة والثانية بعد 5-6 ساعات، وهناك نوع آخر يؤخذ مرتين أو ثلاثا قبل وجبات الطعام بعشرين دقيقة، لذا يجب قراءة المنشور المرفق مع كل حارق دهون.",
      types: "",
      color: Color(0xFFC54751)),
  SupplementsAssets(
      id: 12,
      name: "قبل التمرين",
      image: "assets/images/supplements/preworkout.png",
      desc:
          " Gold Standard Pre-Workoutهو مكمل غذائي صمم بحيث يتم تناوله قبل التمارين الشاقة سواء كانت كمال الأجسام أو غيرة من التمارين التي تحتاج جهد بدني وعضلي عالي، بحيث يؤخذ لتحسين الأداء الرياضي وبناء العضلات أثناء التمارين وتسريع عملية الاستشفاء العضلي ومن اضراره ان نسبة الكافيين المرتفعة قد تسبب لك التوتر والارق خاصة اذا كنت تتدرب في الفترة المسائية وينصح باستشارة الطبيب قبل استخدام هذا المكمل .",
      benefits:
          "– تحسن بناء العضلات.\n– تسرع استعادة بناء أنسجة العضلات المتهدمة واستشفائها.\n– يؤخر الشعور بالتعب والإرهاق وبالتالي ستزداد فترة التدريب.\n– تزيد قدرة الجسم والعضلات علي التحمل.\n– يحتوي علي 175 ملي جرام من الكافيين من مصادر طبيعية فقط تتمثل في الشاي والقهوة، الذي يساعد علي التركيز والانتباه.\n– سيساعدك علي تحقيق أفضل أداء لك.\n",
      dosage:
          "يحضر بمزج اسكوب واحد علي ماء قبل التمارين بفترة تتراوح ما بين 20 إلي 30 دقيقة.",
      types: "",
      color: Color(0xFFFCCD73)),
];
