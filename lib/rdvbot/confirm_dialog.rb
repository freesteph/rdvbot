# frozen_string_literal: true

module Rdvbot
  class ConfirmDialog
    def call(data)
      {
        "callback_id": 'event_summary',
        "title": 'Proposition de rendez-vous',
        "introduction_text": "Vérifiez et ajustez si nécessaire les éléments du rendez-vous. Appuyez sur 'Confirmer' pour envoyer une invitation par email aux participants.",
        "elements": [
          {
            "display_name": 'Objet du rendez-vous',
            "name": 'title',
            "type": 'text',
            "placeholder": "Goûter avec l'équipe Animation",
            "help_text": "Le sujet de l'évènement.",
            "default": data['title']
          },
          {
            "display_name": 'Début du rendez-vous',
            "name": 'start',
            "type": 'text',
            "placeholder": 'YYYY-MM-DD HH:MM',
            "help_text": 'Date et heure de début du rendez-vous',
            "default": data['start']
          },
          {
            "display_name": 'Fin du rendez-vous',
            "name": 'end',
            "type": 'text',
            "placeholder": 'YYYY-MM-DD HH:MM',
            "help_text": 'Date et heure de fin du rendez-vous.',
            default: data['ending']
          },
          {
            "display_name": 'Lieu',
            "optional": true,
            "name": 'location',
            "type": 'text',
            "placeholder": 'DINUM, 20 avenue de Ségur, 75007 Paris',
            "help_text": "Le lieu de l'évènement",
            "default": data['location']
          },
          {
            "display_name": 'Participants',
            "name": 'participants',
            "type": 'textarea',
            "placeholder": 'Enter the list of participants',
            "help_text": 'Listes des participants, séparée par des virgules.',
            "default": data['participants'].join(', ')
          },
          {
            "display_name": "Description de l'évènement",
            "optional": true,
            "name": 'description',
            "type": 'textarea',
            "placeholder": 'Chacun amène ses biscuits préférés et les fait goûter à son prochain',
            "help_text": "Description de l'évènement",
            "default": data['description']
          }
        ],
        "submit_label": 'Confirmer le rendez-vous'
      }
    end
  end
end
