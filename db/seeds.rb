teacher_increment = 1
student_increment = 1

2.times do
	teacher = User.create(
		email: "teacher.test.#{teacher_increment}@test.com",
		password: 'password',
		teacher: true,
		name: Faker::Name.name
	)

	teacher_profile = teacher.build_profile(
		instrument: ['Piano', 'Piccolo', 'Mouth Harp', 'Harmonica'].sample,
		birthday: Faker::Date.between(50.years.ago, 20.years.ago),
		gender: ['boy', 'girl'].sample,
		bio: Faker::Lorem.sentences(2),
		user_id: teacher.id, 
	)

	teacher_profile.save

	teacher_increment += 1

	5.times do
		student = User.create(
			email: "student.test.#{student_increment}@test.com",
			password: 'password',
			teacher_id: teacher.id,
			name: Faker::Name.name
		)

		student.update(teacher: false)

		student_profile = student.build_profile(
			instrument: teacher.profile.instrument,
			birthday: Faker::Date.between(20.years.ago, 4.years.ago),
			gender: ['boy', 'girl'].sample,
			bio: Faker::Lorem.sentences(2),
			user_id: student.id	 
		)

		student_profile.save

		student_increment += 1

		lesson_date_increment = 25
		3.times do
			lesson = Lesson.create(
				date: Faker::Date.between(lesson_date_increment.days.ago, (lesson_date_increment - 1).days.ago),
				feedback: Faker::Lorem.sentences(2),
				rating: (1..5).to_a.sample,
				student_id: student.id,
				teacher_id: teacher.id 
			)

			lesson_note = LessonNote.create(
				notes: Faker::Lorem.sentences(2),
				lesson_id: lesson.id
			)

			3.times do
				assignment = Assignment.create(
					book: ['Lesson', 'Technique', 'Hannon', 'Theory', 'Performance'].sample,
					page: (1..30).to_a.sample,
					per_day: (3..10).to_a.sample,
					per_week: (3..7).to_a.sample,
					instruction: Faker::Lorem.sentences(2),
					lesson_id: lesson.id
				)

				per_day = (1..assignment.per_day).to_a.sample
				per_week = (1..assignment.per_week).to_a.sample

				(per_day * per_week).times do 
					practice = Practice.create(
						assignment_id: assignment.id,
						created_at: (lesson.date + (1..6).to_a.sample.days)
					)
				end
			end
			lesson_date_increment -= 7
		end
	end
end
