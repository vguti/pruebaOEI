
# Crear escuelas
School.create!(name: "educacion")
School.create!(name: "lenguas")
School.create!(name: "ciencia-y-cultura")
School.create!(name: "cooperacion")


# Crear tipos
CourseType.create!(name: "infantil", school_id: 1)
CourseType.create!(name: "competencias-digitales", school_id: 1)
CourseType.create!(name: "gobernanza", school_id: 1)
CourseType.create!(name: "portugues", school_id: 2)
CourseType.create!(name: "educacion-artistica", school_id: 3)
CourseType.create!(name: "divulgacion-cientifica", school_id: 3)
CourseType.create!(name: "cooperacion", school_id: 4)

# Crear ediciones
Edition.create!(date: "2023-06-01")
Edition.create!(date: "2023-09-01")
Edition.create!(date: "2021-06-01")


# Crear cursos
Course.create!(name: "Especialista en cooperación internacional", course_type_id: 7, school_id: 4, edition_id: 1)
Course.create!(name: "Especialista en cooperación internacional", course_type_id: 7, school_id: 4, edition_id: 3)
Course.create!(name: "Divulgación y cooperación de la ciencia", course_type_id: 6, school_id: 3, edition_id: 2)
Course.create!(name: "Divulgación y cooperación de la ciencia", course_type_id: 6, school_id: 3, edition_id: 1)
Course.create!(name: "Comprendiendo el portugués", course_type_id: 4, school_id: 2, edition_id: 2)
Course.create!(name: "Competencias digitales en la educación infantil", course_type_id: 2, school_id: 1, edition_id: 2)


