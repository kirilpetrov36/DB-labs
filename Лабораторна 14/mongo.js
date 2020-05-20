db.createCollection("Week_days")
db.week_days.insertMany([
    { "week_day": "Monday" },
    { "week_day": "Tuesday" },
    { "week_day": "Wednesday" },
    { "week_day": "Thursay" },
    { "week_day": "Friday" },
    { "week_day": "Saturady" },
    { "week_day": "Sunday" }
])

db.createCollection("Speciality")
db.Speciality.insertMany([
    { "name": "Design" },
    { "name": "Philosophy" },
    { "name": "Computer science" },
    { "name": "Economy" },
    { "name": "Finance and banking" },
    { "name": "Mathematic" },
    { "name": "Electronics" }
])
db.createCollection("Buildings")
db.Buildings.insertMany([
    { "number": 0, "address": "12, Stepana Bandery street" },
    { "number": 1, "address": "24, Karpinskogo street" },
    { "number": 2, "address": "6, Karpinskogo street" },
    { "number": 3, "address": "1, St. Georges Square" },
    { "number": 4, "address": "5, Mytropolyta Andriya street" },
    { "number": 5, "address": "28a, Stepana Bandery street" },
    { "number": 6, "address": "32, Stepana Bandery street" },
    { "number": 7, "address": "55, Stepana Bandery street" },
    { "number": 19, "address": "1/3, Knyazya Romana street" },
    { "number": 20, "address": "5, Knyazya Romana street" },
    { "number": 28, "address": "3, Mytropolyta Andriya street" }
])

db.createCollection("Cathedra")
db.Cathedra.insertMany([
    { "name": "Artificial Intelingence System", "building_id": db.Buildings.findOne({ number: 20 })._id },
    { "name": "Computer aided design systems", "building_id": db.Buildings.findOne({ number: 4 })._id },
    { "name": "Philosophy", "building_id": db.Buildings.findOne({ number: 4 })._id },
    { "name": "Applied Mathematic", "building_id": db.Buildings.findOne({ number: 4 })._id }
])

db.createCollection("Teachers")
db.Teachers.insertMany([
    { "name": "Melnykova N. I.", "degree": "Candidate of Technical Sciences", "length_of_service": 11, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }) },
    { "name": "Gasko R. T.", "degree": "Researcher", "length_of_service": 7, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }) },
    { "name": "Boyko N. I.", "degree": "Candidate of Economy Sciences", "length_of_service": 10, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }) },
    { "name": "Rzheuskiy A. V.", "degree": "Candidate of Social comunications", "length_of_service": 7, "cathedra_id": db.Cathedra.findOne({ name: " Computer aided design systems" }) },
    { "name": "Panchak R. T.", "degree": "Senior Lecturer", "length_of_service": 43, "cathedra_id": db.Cathedra.findOne({ name: " Computer aided design systems" }) },
    { "name": "Shvorob I. B.", "degree": "Candidate of Technical Sciences", "length_of_service": 8, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }) },
    { "name": "Kuchkovskiy V. V.", "degree": "Assistant", "length_of_service": 4, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }) },
    { "name": "Burov Y. V.", "degree": "Doctor of Technical Sciences", "length_of_service": 30, "cathedra_id": db.Cathedra.findOne({ name: "Computer aided design systems" }) },
    { "name": "Tymoshuk P. V.", "degree": "Doctor of Technical Sciences", "length_of_service": 38, "cathedra_id": db.Cathedra.findOne({ name: "Computer aided design systems" }) },
    { "name": "Holovatiy A. I", "degree": "Assistant", "length_of_service": 10, "cathedra_id": db.Cathedra.findOne({ name: "Computer aided design systems" }) },
    { "name": "Karivets I. V.", "degree": "Doctor of Philosophy", "length_of_service": 23, "cathedra_id": db.Cathedra.findOne({ name: "Philosophy" }) },
    { "name": "Peleshyshyn O. P.", "degree": "Candidate of Technical Sciences", "length_of_service": 18, "cathedra_id": db.Cathedra.findOne({ name: "Applied Mathematic" }) }
])

db.createCollection("Curriculum")
db.Curriculum.insertMany([
    { "subject_name": "Data Bases", "speciality_id": db.Speciality.findOne({ name: "Computer science" })._id, "teacher_id": db.Teachers.findOne({ name: "Melnykova N. I." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "Web design", "speciality_id": db.Speciality.findOne({ name: "Computer science" })._id, "teacher_id": db.Teachers.findOne({ name: "Gasko R. T." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "System analysis", "speciality_id": db.Speciality.findOne({ name: "Computer science" })._id, "teacher_id": db.Teachers.findOne({ name: "Boyko N. I." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "Computer networks", "speciality_id": db.Speciality.findOne({ name: "Computer science" })._id, "teacher_id": db.Teachers.findOne({ name: "Rzheuskiy A. V." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "Computer circuitry", "speciality_id": db.Speciality.findOne({ name: "Electronics" })._id, "teacher_id": db.Teachers.findOne({ name: "Panchak R. T." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "Philosophy", "speciality_id": db.Speciality.findOne({ name: "Philosophy" })._id, "teacher_id": db.Teachers.findOne({ name: "Karivets I. V." }), "year": 2018, "type": "Bachelor" },
    { "subject_name": "MMOR", "speciality_id": db.Speciality.findOne({ name: "Mathematic" })._id, "teacher_id": db.Teachers.findOne({ name: "Peleshyshyn O. P." }), "year": 2018, "type": "Bachelor" }
])

db.createCollection("Classrooms")
db.Classrooms.insertMany([
    { "number": 117, "building_number": db.Buildings.findOne({ number: 1 }), "capacity": 120 },
    { "number": 201, "building_number": db.Buildings.findOne({ number: 20 }), "capacity": 17 },
    { "number": 501, "building_number": db.Buildings.findOne({ number: 4 }), "capacity": 15 },
    { "number": 0, "building_number": db.Buildings.findOne({ number: 20 }), "capacity": 120 },
    { "number": 124, "building_number": db.Buildings.findOne({ number: 20 }), "capacity": 25 },
    { "number": 123, "building_number": db.Buildings.findOne({ number: 20 }), "capacity": 50 },
    { "number": 321, "building_number": db.Buildings.findOne({ number: 4 }), "capacity": 25 },
    { "number": 125, "building_number": db.Buildings.findOne({ number: 20 }), "capacity": 25 },
    { "number": 109, "building_number": db.Buildings.findOne({ number: 1 }), "capacity": 35 },
    { "number": 409, "building_number": db.Buildings.findOne({ number: 28 }), "capacity": 25 },
])

db.createCollection("Groups")
db.Groups.insertMany([
    { "name": "KN208", "course": 2, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }), "speciality": db.Speciality.findOne({ name: "Computer science" }), "amount": 31 },
    { "name": "KN209", "course": 2, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }), "speciality": db.Speciality.findOne({ name: "Computer science" }), "amount": 29 },
    { "name": "KN210", "course": 2, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }), "speciality": db.Speciality.findOne({ name: "Computer science" }), "amount": 28 },
    { "name": "KN211", "course": 2, "cathedra_id": db.Cathedra.findOne({ name: "Artificial Intelingence System" }), "speciality": db.Speciality.findOne({ name: "Computer science" }), "amount": 30 }
])

var KN208_id = db.Groups.findOne({ name: "KN208" })._id
var KN209_id = db.Groups.findOne({ name: "KN209" })._id
var KN210_id = db.Groups.findOne({ name: "KN210" })._id
var KN211_id = db.Groups.findOne({ name: "KN211" })._id

db.createCollection("Schedule")
db.Schedule.insertMany([
    { "weekDay_id": 1, "number": 2, "subject_id": db.Curriculum.findOne({ subject_name: "Computer networks" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Melnykova N. I." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 117 })._id, "parity": "no_matter" },
    { "weekDay_id": 1, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Computer circuitry" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Panchak R. T." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 117 })._id, "parity": "no_matter" },
    { "weekDay_id": 2, "number": 1, "subject_id": db.Curriculum.findOne({ subject_name: "Computer circuitry" })._id, "type": "Laboratory", "teacher_id": db.Teachers.findOne({ name: "Holovatiy A. I" })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 501 })._id, "parity": "denominator" },
    { "weekDay_id": 2, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Data Bases" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Melnykova N. I." })._id, "group_id": [KN208_id, KN209_id, KN210_id, KN211_id], "classroom": db.Classrooms.findOne({ number: 0 })._id, "parity": "no_matter" },
    { "weekDay_id": 2, "number": 5, "subject_id": db.Curriculum.findOne({ subject_name: "Computer networks" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Rzheuskiy A. V." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 409 })._id, "parity": "no_matter" },
    { "weekDay_id": 3, "number": 1, "subject_id": db.Curriculum.findOne({ subject_name: "MMOR" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Peleshyshyn O. P." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 201 })._id, "parity": "no_matter" },
    { "weekDay_id": 3, "number": 2, "subject_id": db.Curriculum.findOne({ subject_name: "Data Bases" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Melnykova N. I." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 124 })._id, "parity": "no_matter" },
    { "weekDay_id": 3, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Data Bases" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Melnykova N. I." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 124 })._id, "parity": "denominator" },
    { "weekDay_id": 3, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "System analysis" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Boyko N. I." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 123 })._id, "parity": "numerator" },
    { "weekDay_id": 3, "number": 4, "subject_id": db.Curriculum.findOne({ subject_name: "MMOR" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Boyko N. I." })._id, "group_id": [KN208_id, KN209_id, KN210_id, KN211_id], "classroom": db.Classrooms.findOne({ number: 0 })._id, "parity": "no_matter" },
    { "weekDay_id": 4, "number": 1, "subject_id": db.Curriculum.findOne({ subject_name: "Philosophy" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Karivets I. V." })._id, "group_id": [KN208_id, KN209_id, KN210_id, KN211_id], "classroom": db.Classrooms.findOne({ number: 117 })._id, "parity": "no_matter" },
    { "weekDay_id": 4, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Computer circuitry" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Tymoshuk P. V." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 321 })._id, "parity": "numerator" },
    { "weekDay_id": 4, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Web design" })._id, "type": "Laboratory", "teacher_id": db.Teachers.findOne({ name: "Kuchkovskiy V. V." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 125 })._id, "parity": "no_matter" },
    { "weekDay_id": 5, "number": 1, "subject_id": db.Curriculum.findOne({ subject_name: "Web design" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Gasko R. T." })._id, "group_id": [KN208_id, KN209_id, KN210_id, KN211_id], "classroom": db.Classrooms.findOne({ number: 0 })._id, "parity": "no_matter" },
    { "weekDay_id": 5, "number": 2, "subject_id": db.Curriculum.findOne({ subject_name: "System analysis" })._id, "type": "Lecture", "teacher_id": db.Teachers.findOne({ name: "Boyko N. I." })._id, "group_id": [KN208_id, KN209_id, KN210_id, KN211_id], "classroom": db.Classrooms.findOne({ number: 0 })._id, "parity": "no_matter" },
    { "weekDay_id": 5, "number": 3, "subject_id": db.Curriculum.findOne({ subject_name: "Philosophy" })._id, "type": "Practical", "teacher_id": db.Teachers.findOne({ name: "Karivets I. V." })._id, "group_id": KN210_id, "classroom": db.Classrooms.findOne({ number: 109 })._id, "parity": "denominator" }
])