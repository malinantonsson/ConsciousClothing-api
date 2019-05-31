# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#pablo_lledo = BookSupplier.create(company: "Pablo Lledó - ProjectManagement")
#Book.create(supplier: pablo_lledo)


materials = Material.create([{ name: 'Cotton'}, { name: 'Linen' }])
items = Item.create([{ name: 'Black jeans' }, { name: 'Grey jeans' }])

#   Character.create(name: 'Luke', movie: movies.first)
