outdoor = GroupClassification.find_or_create_by(name: 'Outdoor')

SubGroupClassification.find_or_create_by(name: 'LOS', group_classification_id: outdoor.id)
SubGroupClassification.find_or_create_by(name: 'Antenna Mount', group_classification_id: outdoor)
SubGroupClassification.find_or_create_by(name: 'Outdoor Cable', group_classification_id: outdoor)

indoor = GroupClassification.find_or_create_by(name: 'Indoor')

SubGroupClassification.find_or_create_by(name: 'MSAD', group_classification_id: indoor.id)
SubGroupClassification.find_or_create_by(name: 'Equipment Room', group_classification_id: indoor.id)
SubGroupClassification.find_or_create_by(name: 'Indoor Cable', group_classification_id: indoor.id)