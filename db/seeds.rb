# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Grade.create(year: '1回生')
Grade.create(year: '2回生')
Grade.create(year: '3回生')
Grade.create(year: '4回生')

Department.create(name: '経済学部')
Department.create(name: '理工学部')
Department.create(name: 'スポーツ健康科学部')
Department.create(name: '食マネジメント学部')
Department.create(name: '情報理工学部')
Department.create(name: '生命科学部')
Department.create(name: '薬学部')

Subject.create(name: '経済学科')
Subject.create(name: '理工学科')
Subject.create(name: 'スポーツ健康科学科')
Subject.create(name: '食マネジメント学科')
Subject.create(name: '情報理工学科')
Subject.create(name: '生命科学科')
Subject.create(name: '薬学科')