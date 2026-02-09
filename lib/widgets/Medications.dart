class Panadol {
  static String name = "Panadol";
  static String scientificName = "Paracetamol / Acetaminophen";
  static String dosage = """
* Adults: 500-1000 mg every 4-6 hours as needed (maximum 4 g/day)
* Elderly: Usually the same, but caution is mandatory with liver disease
* Children:
  - 2-3 months: 10-15 mg/kg every 6-8 hours
  - 3 months-12 years: 10-15 mg/kg every 4-6 hours (maximum 60 mg/kg/day)
* Formulations: Tablets, chewable tablets, liquid suspension, suppositories
""";
  static String label = "Pain Reliever & Fever Reducer";
  static List<String> PanadolUseCases = [
    "Headache",
    "Fever",
    "Toothache",
    "Muscle pain",
    "Osteoarthritis pain",
    "Cold and flu symptoms",
  ];
  static List<String> PanadolavoidIf = [
    "Severe liver disease or active liver failure",
    "Severe hypersensitivity to paracetamol",
    "Chronic alcohol abuse (increases risk of liver toxicity)",
    "Severe kidney impairment",
  ];
  static List<String> PanadolsideEffects = [
    "Generally well-tolerated",
    "Rare: nausea, vomiting",
    "Rare: rash",
    "Rare: headache",
    "Long-term high doses: liver damage",
  ];
  static List<String> PanadolAllergicReactions = [
    "Rash",
    "Hives",
    "Itching",
    "Swelling of face, lips, tongue, or throat",
    "Severe difficulty breathing (rare, anaphylaxis)",
  ];
}

class Aspirin {
  static String name = "Aspirin";
  static String scientificName = "Acetylsalicylic Acid (ASA)";
  static String dosage = """
* Adults (pain/fever): 325-650 mg every 4-6 hours as needed (maximum 4 g/day)
* Adults (cardiovascular prevention): 75-100 mg once daily
* Children: Generally avoided in children with viral infections due to risk of Reye's syndrome
* Formulations: Tablets, chewable tablets, enteric-coated tablets, suppositories
""";
  static String label = "Blood Thinner & Anti-Inflammatory";

  static List<String> AspirinUseCases = [
    "Mild to moderate pain (headache, toothache, muscle pain)",
    "Fever",
    "Inflammatory conditions (arthritis)",
    "Prevention of heart attack or stroke (low-dose therapy)",
    "Post-myocardial infarction therapy",
  ];
  static List<String> AspirinavoidIf = [
    "History of hypersensitivity to aspirin or other NSAIDs",
    "Active peptic ulcer disease or gastrointestinal bleeding",
    "Severe liver or kidney disease",
    "Children or teenagers with viral infections (risk of Reye's syndrome)",
    "Pregnancy (especially third trimester)",
  ];
  static List<String> AspirinsideEffects = [
    "Gastrointestinal upset, nausea, vomiting",
    "Stomach pain or heartburn",
    "Bleeding or bruising easily",
    "Ringing in the ears (tinnitus) at high doses",
    "Rare: allergic reactions, kidney damage with long-term use",
  ];
  static List<String> AspirinAllergicReactions = [
    "Rash",
    "Hives",
    "Swelling of face, lips, tongue, or throat",
    "Severe difficulty breathing (anaphylaxis - rare)",
  ];
}

class Albuterol {
  static String name = "Albuterol";
  static String scientificName = "Albuterol";
  static String dosage = """
* Inhalation (MDI or Nebulizer):
  - Adults & children ≥ 12 yrs: 90-180 mcg (1-2 puffs) every 4-6 hours as needed
  - Children 4-11 yrs: 90 mcg (1 puff) every 4-6 hours as needed
* Nebulizer solution:
  - Adults & children ≥ 12 yrs: 2.5 mg 3-4 times daily
  - Children 2-12 yrs: 0.63-1.25 mg 3-4 times daily
* Oral tablets/syrup (less common, systemic use):
  - Adults: 2-4 mg 3-4 times daily
  - Children 6-12 yrs: 2 mg 3-4 times daily
""";
  static String label = "Asthma & COPD Controller";

  static List<String> AlbuterolUseCases = [
    "Acute asthma attacks",
    "Exercise-induced bronchospasm",
    "Chronic obstructive pulmonary disease (COPD) flare-ups",
    "Bronchospasm caused by allergens, cold air, or irritants",
  ];
  static List<String> AlbuterolavoidIf = [
    "Severe hypersensitivity to albuterol or any component of the formulation",
    "History of paradoxical bronchospasm with prior beta-agonist use",
    "Severe cardiovascular disorders (use with caution)",
    "Severe uncontrolled hypertension",
  ];
  static List<String> AlbuterolsideEffects = [
    "Nervousness or anxiety",
    "Headache",
    "Palpitations or fast heart rate",
    "Muscle cramps",
    "Mild throat irritation (inhaled form)",
  ];
  static List<String> AlbuterolAllergicReactions = [
    "Rash",
    "Itching",
    "Hives",
    "Swelling of face, lips, or tongue",
    "Severe difficulty breathing (rare, anaphylaxis)",
  ];
}

class Enalapril {
  static String name = "Enalapril";
  static String scientificName = "Enalapril Maleate";
  static String dosage = """
* Adults (hypertension):
  - Initial: 5 mg once daily
  - Maintenance: 10-40 mg daily in 1-2 divided doses
* Adults (heart failure):
  - Initial: 2.5 mg once daily
  - Maintenance: 5-20 mg daily in 1-2 divided doses
* Elderly or renal impairment: Start lower (2.5 mg once daily) and titrate carefully
""";
  static String label = "Relax Blood Vessels";

  static List<String> EnalaprilUseCases = [
    "Hypertension (high blood pressure)",
    "Congestive heart failure",
    "Asymptomatic left ventricular dysfunction",
    "Kidney protection in type 1 diabetes with proteinuria",
  ];
  static List<String> EnalaprilavoidIf = [
    "History of angioedema related to previous ACE inhibitor therapy",
    "Pregnancy (especially second and third trimester)",
    "Severe kidney impairment (especially bilateral renal artery stenosis)",
    "Hypersensitivity to enalapril or any component of the formulation",
  ];
  static List<String> EnalaprilsideEffects = [
    "Cough (dry, persistent) – most common",
    "Dizziness or lightheadedness",
    "Hyperkalemia (high potassium levels)",
    "Fatigue",
    "Headache",
  ];
  static List<String> EnalaprilAllergicReactions = [
    "Angioedema (swelling of face, lips, tongue, or throat) - potentially life-threatening",
    "Rash",
    "Hives",
    "Severe itching",
    "Difficulty breathing",
  ];
}

class Lisinopril {
  static String name = "Lisinopril";
  static String scientificName = "Lisinopril Dihydrate";
  static String dosage = """
* Adults (Hypertension
  - Initial: 10 mg once daily
  - Maintenance: 20-40 mg once daily
* Adults (Heart failure
  - Initial: 2.5-5 mg once daily
  - Maintenance: 20-40 mg daily, may be divided into 1-2 doses
* Elderly or renal impairment:** Start lower (2.5-5 mg) and titrate carefully
""";
  static String label = "Reduces Strain On Heart";

  static List<String> LisinoprilUseCases = [
    "Hypertension (high blood pressure)",
    "Heart failure",
    "Post-myocardial infarction (to improve survival)",
    "Kidney protection in type 1 diabetes with proteinuria",
  ];
  static List<String> LisinoprilavoidIf = [
    "History of angioedema related to previous ACE inhibitor therapy",
    "Pregnancy (especially second and third trimester)",
    "Severe renal impairment (especially bilateral renal artery stenosis)",
    "Hypersensitivity to lisinopril or any component of the formulation",
    "Severe dehydration or low blood volume",
  ];
  static List<String> LisinoprilsideEffects = [
    "Persistent dry cough - most common",
    "Dizziness or lightheadedness",
    "Hyperkalemia (high potassium levels)",
    "Low blood pressure (hypotension)",
  ];
  static List<String> LisinoprilAllergicReactions = [
    "Angioedema (swelling of face, lips, tongue, or throat) - potentially life-threatening",
    "Rash",
    "Hives",
    "Severe itching",
    "Difficulty breathing",
  ];
}

class Loratadine {
  static String name = "Loratadine";
  static String scientificName = "Loratadine";
  static String dosage = """
* Adults and children ≥ 12 years: 10 mg once daily
* Children 6-11 years 5 mg once daily
* Children 2-5 years 5 mg once daily (usually syrup)
* Elderly 10 mg once daily; no adjustment usually needed for mild/moderate kidney impairment
* Maximum dose 10 mg/day
""";
  static String label = "Antihistamine - Allergy Relief";

  static List<String> LoratadineUseCases = [
    "Seasonal allergic rhinitis (hay fever)",
    "Perennial allergic rhinitis",
    "Chronic urticaria (hives)",
    "Other allergy symptoms: itchy eyes, sneezing, runny nose",
  ];
  static List<String> LoratadineavoidIf = [
    "Hypersensitivity to loratadine or any component of the formulation",
    "Severe liver impairment (dose adjustment may be required)",
    "Pregnancy or breastfeeding - use only if clearly needed",
    "Severe kidney impairment",
  ];
  static List<String> LoratadinesideEffects = [
    "Headache",
    "Fatigue",
    "Dry mouth",
    "Drowsiness (rare compared to first-generation antihistamines)",
    "Stomach pain or nausea",
  ];
  static List<String> LoratadineAllergicReactions = [
    "Rash",
    "Hives",
    "Itching",
    "Swelling of face, lips, tongue, or throat",
    "Severe difficulty breathing (rare, anaphylaxis)",
  ];
}
